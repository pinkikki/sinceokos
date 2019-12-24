package diary

import (
	context "context"
	fmt "fmt"
	"os"
	"time"

	"github.com/pinkikki/sinceokos/server/app/file"
	mongodb "github.com/pinkikki/sinceokos/server/app/mongo"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type BsonDiary struct {
	Id        primitive.ObjectID `json:"_id" bson:"_id,omitempty"`
	Title     string             `json:"title"`
	Text      string             `json:"text"`
	CreatedAt time.Time          `json:"created_at" bson:"created_at"`
	UpdatedAt time.Time          `json:"updated_at" bson:"updated_at"`
}

func Find(id string) (*Diary, error) {
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongodb.Database("sinceokos").Collection("diary")

	var current *BsonDiary
	var previous *BsonDiary
	var next *BsonDiary
	objectID, _ := primitive.ObjectIDFromHex(id)
	err := collection.FindOne(ctx, bson.M{"_id": objectID}).Decode(&current)
	if err != nil {
		return nil, err
	}
	diary := toDiary(current)

	pops := options.FindOne().SetSort(bson.M{"_id": -1})
	err = collection.FindOne(ctx, bson.M{"_id": bson.M{"$lt": objectID}}, pops).Decode(&previous)
	if err != nil {
		fmt.Printf("Falied to find previous diary. err=[%v]", err)
	} else {
		diary.Previous = previous.Id.Hex()
	}

	nops := options.FindOne().SetSort(bson.M{"_id": 1})
	err = collection.FindOne(ctx, bson.M{"_id": bson.M{"$gt": objectID}}, nops).Decode(&next)
	if err != nil {
		fmt.Printf("Falied to find next diary. err=[%v]", err)
	} else {
		diary.Next = next.Id.Hex()
	}

	return diary, nil
}

func FindAll() ([]*Diary, error) {
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongodb.Database("sinceokos").Collection("diary")
	return find(ctx, collection, bson.D{}, true)
}

func FindNext(id string) (*Diary, error) {
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongodb.Database("sinceokos").Collection("diary")
	options := options.Find()
	options.SetLimit(3)
	options.SetSort(bson.M{"_id": 1})
	objectID, _ := primitive.ObjectIDFromHex(id)
	diaries, err := find(ctx, collection, bson.M{"_id": bson.M{"$gte": objectID}}, true, options)
	var diary *Diary
	if 1 < len(diaries) {
		diary = diaries[1]
	} else {
		diary = &Diary{}
	}

	return diary, err
}

func FindPrevious(id string) (*Diary, error) {
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongodb.Database("sinceokos").Collection("diary")
	options := options.Find()
	options.SetLimit(3)
	options.SetSort(bson.M{"_id": -1})
	objectID, _ := primitive.ObjectIDFromHex(id)
	diaries, err := find(ctx, collection, bson.M{"_id": bson.M{"$lte": objectID}}, false, options)
	var diary *Diary
	if 1 < len(diaries) {
		diary = diaries[1]
	} else {
		diary = &Diary{}
	}

	return diary, err
}

func Insert(diary *Diary) error {
	bd, err := toBsonDiary(diary)
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	now := time.Now()
	diary.CreatedAt = now
	diary.UpdatedAt = now
	ctx, _ := context.WithTimeout(context.Background(), 50*time.Second)
	collection := mongodb.Database("sinceokos").Collection("diary")
	res, err := collection.InsertOne(ctx, bd)
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	id := res.InsertedID
	fmt.Printf("%v", id)
	return nil
}

func Update(diary *Diary) error {
	bd, err := toBsonDiary(diary)
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	bd.UpdatedAt = time.Now()
	ctx, _ := context.WithTimeout(context.Background(), 50*time.Second)
	collection := mongodb.Database("sinceokos").Collection("diary")

	res, err := collection.UpdateOne(ctx, bson.M{"_id": bd.Id}, bson.M{"$set": bson.M{"title": bd.Title, "text": bd.Text, "updated_at": bd.UpdatedAt}})
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	id := res.UpsertedID
	fmt.Printf("%v", id)
	return nil
}

func Read(dsi *DiarySnapshotId) (*os.File, error) {
	wd, err := os.Getwd()
	if err != nil {
		return nil, err
	}
	return file.Read(wd, dsi.Id)
}

func GetWriter() (*os.File, error) {
	wd, err := os.Getwd()
	if err != nil {
		return nil, err
	}
	return file.Create(wd, "sample")
}

func find(ctx context.Context, collection *mongo.Collection, filter interface{}, asc bool,
	opts ...*options.FindOptions) ([]*Diary, error) {
	cur, err := collection.Find(ctx, filter, opts...)
	defer cur.Close(ctx)
	if err != nil {
		return nil, err
	}

	diaries := []*Diary{}
	var tmp *BsonDiary
	for cur.Next(ctx) {
		var bd *BsonDiary
		err = cur.Decode(&bd)
		if err != nil {
			return nil, err
		}
		d := toDiary(bd)
		if tmp != nil {
			last := diaries[len(diaries)-1]
			if asc {
				d.Previous = tmp.Id.Hex()
				last.Next = d.Id
			} else {
				d.Next = tmp.Id.Hex()
				last.Previous = d.Id
			}
		}
		tmp = bd
		diaries = append(diaries, d)
	}
	if err = cur.Err(); err != nil {
		return nil, err
	}

	return diaries, nil
}

func toDiary(bd *BsonDiary) *Diary {
	return &Diary{
		Id:        bd.Id.Hex(),
		Title:     bd.Title,
		Text:      bd.Text,
		CreatedAt: bd.CreatedAt,
		UpdatedAt: bd.UpdatedAt,
	}
}

func toBsonDiary(d *Diary) (*BsonDiary, error) {
	bd := &BsonDiary{
		Title:     d.Title,
		Text:      d.Text,
		CreatedAt: d.CreatedAt,
		UpdatedAt: d.UpdatedAt,
	}

	id, err := primitive.ObjectIDFromHex(d.Id)
	if err == nil {
		bd.Id = id
	}

	return bd, nil
}

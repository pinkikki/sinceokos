package diary

import (
	context "context"
	fmt "fmt"
	"time"

	"github.com/pinkikki/sinceokos/server/app/mongo"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
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
	var bd *BsonDiary
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")

	objectID, _ := primitive.ObjectIDFromHex(id)
	err := collection.FindOne(ctx, bson.M{"_id": objectID}).Decode(&bd)
	if err != nil {
		return nil, err
	}

	return toDiary(bd), nil
}

func FindAll() ([]*Diary, error) {
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	cur, err := collection.Find(ctx, bson.D{})
	if err != nil {
		return nil, err
	}

	diaries := []*Diary{}
	for cur.Next(ctx) {
		var bd *BsonDiary
		err = cur.Decode(&bd)
		if err != nil {
			return nil, err
		}
		diaries = append(diaries, toDiary(bd))
	}
	if err = cur.Err(); err != nil {
		return nil, err
	}

	cur.Close(ctx)

	return diaries, nil

}

func FindNext(id string) (*Diary, error) {
	var bd *BsonDiary
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	options := options.FindOne()
	options.SetSort(bson.M{"_id": 1})

	objectID, _ := primitive.ObjectIDFromHex(id)
	err := collection.FindOne(ctx, bson.M{"_id": bson.M{"$gt": objectID}}, options).Decode(&bd)
	if err != nil {
		return nil, err
	}

	return toDiary(bd), nil
}

func FindPrevious(id string) (*Diary, error) {
	var bd *BsonDiary
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	options := options.FindOne()
	options.SetSort(bson.M{"_id": -1})

	objectID, _ := primitive.ObjectIDFromHex(id)
	err := collection.FindOne(ctx, bson.M{"_id": bson.M{"$lt": objectID}}, options).Decode(&bd)
	if err != nil {
		return nil, err
	}

	return toDiary(bd), nil
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
	collection := mongo.Database("sinceokos").Collection("diary")
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
	collection := mongo.Database("sinceokos").Collection("diary")

	res, err := collection.UpdateOne(ctx, bson.M{"_id": bd.Id}, bson.M{"$set": bson.M{"title": bd.Title, "text": bd.Text, "updated_at": bd.UpdatedAt}})
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	id := res.UpsertedID
	fmt.Printf("%v", id)
	return nil
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
	id, err := primitive.ObjectIDFromHex(d.Id)
	if err != nil {
		return nil, err
	}

	return &BsonDiary{
			Id:        id,
			Title:     d.Title,
			Text:      d.Text,
			CreatedAt: d.CreatedAt,
			UpdatedAt: d.UpdatedAt,
		},
		nil
}

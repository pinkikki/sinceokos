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

type Diary struct {
	Id        primitive.ObjectID `json:"_id" bson:"_id,omitempty"`
	Title     string             `json:"title"`
	Text      string             `json:"text"`
	CreatedAt time.Time          `json:"created_at"`
	UpdatedAt time.Time          `json:"updated_at"`
}

func Find(id string) (*Diary, error) {
	var diary *Diary
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")

	objectID, _ := primitive.ObjectIDFromHex(id)
	err := collection.FindOne(ctx, bson.M{"_id": objectID}).Decode(&diary)
	if err != nil {
		return nil, err
	}

	return diary, nil
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
		var diary *Diary
		err = cur.Decode(&diary)
		if err != nil {
			return nil, err
		}
		diaries = append(diaries, diary)
	}
	if err = cur.Err(); err != nil {
		return nil, err
	}

	cur.Close(ctx)

	return diaries, nil

}

func FindNext(id string) (*Diary, error) {
	var diary *Diary
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	options := options.FindOne()
	options.SetSort(bson.M{"_id": 1})

	objectID, _ := primitive.ObjectIDFromHex(id)
	err := collection.FindOne(ctx, bson.M{"_id": bson.M{"$gt": objectID}}, options).Decode(&diary)
	if err != nil {
		return nil, err
	}

	return diary, nil
}

func FindPrevious(id string) (*Diary, error) {
	var diary *Diary
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	options := options.FindOne()
	options.SetSort(bson.M{"_id": -1})

	objectID, _ := primitive.ObjectIDFromHex(id)
	err := collection.FindOne(ctx, bson.M{"_id": bson.M{"$lt": objectID}}, options).Decode(&diary)
	if err != nil {
		return nil, err
	}

	return diary, nil
}

func Insert(diary *Diary) error {
	ctx, _ := context.WithTimeout(context.Background(), 50*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	res, err := collection.InsertOne(ctx, diary)
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	id := res.InsertedID
	fmt.Printf("%v", id)
	return nil
}

func Update(diary *Diary) error {
	ctx, _ := context.WithTimeout(context.Background(), 50*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	res, err := collection.UpdateOne(ctx, bson.M{"_id": diary.Id}, bson.M{"$set": bson.M{"title": diary.Title, "text": diary.Text}})
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	id := res.UpsertedID
	fmt.Printf("%v", id)
	return nil
}

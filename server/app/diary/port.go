package diary

import (
	context "context"
	fmt "fmt"
	"time"

	"github.com/pinkikki/sinceokos/server/app/mongo"
	"go.mongodb.org/mongo-driver/bson"
)

type Diary struct {
	No   string
	Text string
}

func Find(no string) (*Diary, error) {
	var diary *Diary
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	err := collection.FindOne(ctx, bson.M{"no": no}).Decode(&diary)
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
	res, err := collection.UpdateOne(ctx, bson.M{"no": diary.No}, bson.M{"$set": bson.M{"text": diary.Text}})
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	id := res.UpsertedID
	fmt.Printf("%v", id)
	return nil
}

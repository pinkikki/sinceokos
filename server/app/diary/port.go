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

func Save(diary *Diary) error {
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	collection := mongo.Database("sinceokos").Collection("diary")
	res, err := collection.InsertOne(ctx, bson.M{"no": 1, "text": "diary"})
	//res, err := collection.InsertOne(ctx, diary)
	if err != nil {
		fmt.Printf("%v", err)
		return err
	}
	id := res.InsertedID
	fmt.Printf("%v", id)
	return nil
}

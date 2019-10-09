package diary

import (
	context "context"
	fmt "fmt"
	"time"

	"github.com/pinkikki/sinceokos/server/app/mongo"
	//"go.mongodb.org/mongo-driver/bson"
)

type Diary struct {
	No   string
	Text string
}

func Find(no string) *Diary {
	return nil
}

func Create(diary * Diary) {
	collection := mongo.Database("sinceokos").Collection("diary")

	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	//res, err := collection.InsertOne(ctx, bson.M{"no": no, "text": "diary"})
	res, err := collection.InsertOne(ctx, diary)
	if err != nil {
		fmt.Printf("%v", err)
		return
	}
	id := res.InsertedID
	fmt.Printf("%v", id)
}

package mongo

import (
	"context"
	"fmt"
	"time"

	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var (
	client        *mongo.Client
	databaseCache map[string]*mongo.Database = make(map[string]*mongo.Database)
)

func init() {
	credential := &options.Credential{Username: "root", Password: "password"}
	co := &options.ClientOptions{Auth: credential}
	c, err := mongo.NewClient(options.Client().ApplyURI("mongodb://localhost:27017"), co)
	if err != nil {
		fmt.Printf("Could not connect to mongodb. %v", err)
		return
	}

	ctx, _ := context.WithTimeout(context.Background(), 10*time.Second)
	err = c.Connect(ctx)

	if err != nil {
		fmt.Printf("Could not connect to mongodb. %v", err)
		return
	}

	client = c
}

func Client() *mongo.Client {
	return client
}

func Database(name string) *mongo.Database {
	database, ok := databaseCache[name]
	if ok {
		return database
	}

	return client.Database(name)
}

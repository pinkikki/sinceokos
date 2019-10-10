package mongo

import (
	"context"
	"fmt"
	"time"

	"github.com/kelseyhightower/envconfig"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type Config struct {
	Username string
	Password string
	Host     string
	Port     string
}

var (
	client        *mongo.Client
	databaseCache map[string]*mongo.Database = make(map[string]*mongo.Database)
	config        Config
)

func init() {
	envconfig.Process("SINCEOKOS_MONGO", &config)
	credential := &options.Credential{Username: config.Username, Password: config.Password}
	co := &options.ClientOptions{Auth: credential}
	c, err := mongo.NewClient(options.Client().ApplyURI("mongodb://"+config.Host+":"+config.Port), co)
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

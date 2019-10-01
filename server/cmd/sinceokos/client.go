package main

import (
	"context"
	"fmt"
	"log"

	"github.com/pinkikki/sinceokos/server/app/diary"
	grpc "google.golang.org/grpc"
)

func main() {
	conn, err := grpc.Dial("127.0.0.1:19003", grpc.WithInsecure())
	if err != nil {
		log.Fatal("client connection error:", err)
	}
	defer conn.Close()

	client := diary.NewDiaryClient(conn)
	request := &diary.DiaryCriteria{No: "1"}
	res, err := client.Get(context.TODO(), request)
	fmt.Printf("result:%#v \n", res)
	fmt.Printf("error::%#v \n", err)
}

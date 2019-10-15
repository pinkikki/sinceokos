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
	request := &diary.DiaryRequest{No: "10002", Text: "diary2"}
	client.Save(request)
	dc := &diary.DiaryCriteria{No: "10001"}
	res, err := client.Get(context.TODO(), dc)
	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}

	fmt.Printf("result:%#v \n", res)
}

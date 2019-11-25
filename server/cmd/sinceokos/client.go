package main

import (
	"context"
	"fmt"
	"log"

	"github.com/golang/protobuf/ptypes/empty"
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
	// saveRequest := &diary.DiaryRequest{No: "10002", Text: "diary2"}
	// r, err := client.Save(context.TODO(), saveRequest)

	// if err != nil {
	// 	fmt.Printf("error::%#v \n", err)
	// 	return
	// }
	// fmt.Printf("response::%#v \n", r)

	dc := &diary.DiaryId{Id: "5ddb144a66385e000799dbc0"}
	one, err := client.Get(context.TODO(), dc)
	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}

	fmt.Printf("one:%#v \n", one)

	next, err := client.Next(context.TODO(), dc)
	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}

	fmt.Printf("next:%#v \n", next)

	previous, err := client.Previous(context.TODO(), dc)
	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}

	fmt.Printf("previous:%#v \n", previous)

	list, err := client.List(context.TODO(), &empty.Empty{})
	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}
	fmt.Printf("list:%#v \n", list)

	// putRequest := &diary.DiaryRequest{No: "10002", Text: "diary20"}
	// ur, err := client.Put(context.TODO(), putRequest)

	// if err != nil {
	// 	fmt.Printf("error::%#v \n", err)
	// 	return
	// }
	// fmt.Printf("response::%#v \n", ur)

}

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
	// saveRequest := &diary.DiaryRequest{Title: "よく泣きます3", Text: "なかなか泣き止みません3"}
	// r, err := client.Save(context.TODO(), saveRequest)

	// if err != nil {
	// 	fmt.Printf("error::%#v \n", err)
	// 	return
	// }
	// fmt.Printf("response::%#v \n", r)

	dc := &diary.DiaryId{Id: "5ddbb16e0ee08a029d02d23e"}
	one, err := client.Get(context.TODO(), dc)
	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}

	fmt.Println("★★★★Get Start★★★★★★★★")
	fmt.Printf("one:%#v \n", one)
	fmt.Println("★★★★Get Start★★★★★★★★")

	next, err := client.Next(context.TODO(), dc)
	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}

	fmt.Println("★★★★NEXT Start★★★★★★★★")
	fmt.Printf("next:%#v \n", next)
	fmt.Println("★★★★NEXT End★★★★★★★★")

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
	fmt.Println("★★★★★★★★★★★★★★★")
	for _, v := range list.Diaries {
		fmt.Printf("e:%v \n", v.Previous)
		fmt.Printf("e:%v \n", v.Next)
	}
	fmt.Println("★★★★★★★★★★★★★★★")

	putRequest := &diary.DiaryRequest{Id: "5ddbb13d0ee08a029d02d23d", Title: "更新", Text: "これは更新しましたよ"}
	ur, err := client.Put(context.TODO(), putRequest)

	if err != nil {
		fmt.Printf("error::%#v \n", err)
		return
	}
	fmt.Printf("response::%#v \n", ur)

}

package main

import (
	"context"
	"io"
	"log"
	"os"

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
	sdown, err := client.Download(context.TODO(), &diary.DiarySnapshotId{Id: "1"})
	name := "test.mod"
	if err != nil {
		log.Printf("%s: %v", name, err)
		return
	}

	f, err := os.Create(name)
	if err != nil {
		log.Printf("%s: %v", name, err)
		sdown.CloseSend()
		return
	}

	for {
		res, err := sdown.Recv()
		if err != nil {
			if err == io.EOF {
				break
			}
			log.Printf("%s: %v", name, err)
			break
		}
		n, err := f.Write(res.Snapshot)
		if err != nil {
			log.Printf("%s: %v, %v", name, err, n)
			break
		}
	}
	f.Close()
	sdown.CloseSend()
}

package main

import (
	"log"
	"net"

	"github.com/pinkikki/sinceokos/server/app/diary"
	grpc "google.golang.org/grpc"
)

func main() {
	listenPort, err := net.Listen("tcp", ":19003")
	if err != nil {
		log.Fatalln(err)
	}
	server := grpc.NewServer()
	diaryService := &diary.DiaryService{}
	diary.RegisterDiaryServer(server, diaryService)
	server.Serve(listenPort)
}

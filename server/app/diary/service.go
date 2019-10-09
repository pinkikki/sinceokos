package diary

import (
	context "context"
	fmt "fmt"
)

type DiaryService struct{}

func (s *DiaryService) Get(context.Context, *DiaryCriteria) (*DiaryResponse, error) {
	diary := Find("1")
	fmt.Printf("%v", diary)
	return &DiaryResponse{No: "1", Text: "1です。"}, nil
}

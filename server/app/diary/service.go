package diary

import (
	context "context"

	empty "github.com/golang/protobuf/ptypes/empty"
)

type DiaryService struct{}

func (s *DiaryService) Get(ctx context.Context, dc *DiaryCriteria) (*DiaryResponse, error) {
	diary, err := Find(dc.No)
	if err != nil {
		return nil, err
	}

	return &DiaryResponse{No: diary.No, Text: diary.Text}, nil
}

func (s *DiaryService) Save(context.Context, *DiaryRequest) (*empty.Empty, error) {
	return nil, nil
}

package diary

import context "context"

type DiaryService struct{}

func (s *DiaryService) Get(context.Context, *DiaryCriteria) (*DiaryResponse, error) {
	return &DiaryResponse{No: "1", Text: "1です。"}, nil
}

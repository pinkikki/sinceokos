package diary

import (
	context "context"

	empty "github.com/golang/protobuf/ptypes/empty"
)

type DiaryService struct{}

func (s *DiaryService) Get(ctx context.Context, dc *DiaryCriteria) (*DiaryResource, error) {
	diary, err := Find(dc.No)
	if err != nil {
		return nil, err
	}

	return &DiaryResource{No: diary.No, Text: diary.Text}, nil
}

func (s *DiaryService) List(context.Context, *empty.Empty) (*DiaryResources, error) {
	diaries, err := FindAll()
	if err != nil {
		return nil, err
	}

	diaryResources := []*DiaryResource{}
	for _, diary := range diaries {
		diaryResources = append(diaryResources, &DiaryResource{No: diary.No, Text: diary.Text})
	}
	return &DiaryResources{Diaries: diaryResources}, nil
}

func (s *DiaryService) Save(ctx context.Context, dr *DiaryRequest) (*empty.Empty, error) {
	err := Insert(&Diary{No: dr.No, Text: dr.Text})
	return &empty.Empty{}, err
}

func (s *DiaryService) Put(ctx context.Context, dr *DiaryRequest) (*empty.Empty, error) {
	err := Insert(&Diary{No: dr.No, Text: dr.Text})
	return &empty.Empty{}, err
}

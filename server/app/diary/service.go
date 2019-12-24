package diary

import (
	context "context"
	"io"

	"github.com/golang/protobuf/ptypes"
	empty "github.com/golang/protobuf/ptypes/empty"
)

type DiaryService struct{}

func (s *DiaryService) Get(ctx context.Context, d *DiaryId) (*DiaryResource, error) {
	diary, err := Find(d.Id)
	if err != nil {
		return nil, err
	}

	createdAt, err := ptypes.TimestampProto(diary.CreatedAt)
	if err != nil {
		return nil, err
	}
	updatedAt, err := ptypes.TimestampProto(diary.UpdatedAt)
	if err != nil {
		return nil, err
	}

	return &DiaryResource{
		Id:        diary.Id,
		Title:     diary.Title,
		Text:      diary.Text,
		CreatedAt: createdAt,
		UpdatedAt: updatedAt,
		Previous:  diary.Previous,
		Next:      diary.Next,
	}, nil
}

func (s *DiaryService) List(context.Context, *empty.Empty) (*DiaryResources, error) {
	diaries, err := FindAll()
	if err != nil {
		return nil, err
	}

	diaryResources := []*DiaryResource{}
	for _, diary := range diaries {

		createdAt, err := ptypes.TimestampProto(diary.CreatedAt)
		if err != nil {
			return nil, err
		}
		updatedAt, err := ptypes.TimestampProto(diary.UpdatedAt)
		if err != nil {
			return nil, err
		}

		diaryResources = append(
			diaryResources,
			&DiaryResource{
				Id:        diary.Id,
				Title:     diary.Title,
				Text:      diary.Text,
				CreatedAt: createdAt,
				UpdatedAt: updatedAt,
				Previous:  diary.Previous,
				Next:      diary.Next,
			},
		)
	}
	return &DiaryResources{Diaries: diaryResources}, nil
}

func (s *DiaryService) Save(ctx context.Context, dr *DiaryRequest) (*empty.Empty, error) {
	err := Insert(&Diary{Title: dr.Title, Text: dr.Text})
	return &empty.Empty{}, err
}

func (s *DiaryService) Put(ctx context.Context, dr *DiaryRequest) (*empty.Empty, error) {
	err := Update(&Diary{Id: dr.Id, Title: dr.Title, Text: dr.Text})
	return &empty.Empty{}, err
}

func (s *DiaryService) Next(ctx context.Context, d *DiaryId) (*DiaryResource, error) {
	diary, err := FindNext(d.Id)
	if err != nil {
		return nil, err
	}

	createdAt, err := ptypes.TimestampProto(diary.CreatedAt)
	if err != nil {
		return nil, err
	}
	updatedAt, err := ptypes.TimestampProto(diary.UpdatedAt)
	if err != nil {
		return nil, err
	}

	return &DiaryResource{
		Id:        diary.Id,
		Title:     diary.Title,
		Text:      diary.Text,
		CreatedAt: createdAt,
		UpdatedAt: updatedAt,
		Previous:  diary.Previous,
		Next:      diary.Next,
	}, nil
}

func (s *DiaryService) Previous(ctx context.Context, d *DiaryId) (*DiaryResource, error) {
	diary, err := FindPrevious(d.Id)
	if err != nil {
		return nil, err
	}

	createdAt, err := ptypes.TimestampProto(diary.CreatedAt)
	if err != nil {
		return nil, err
	}
	updatedAt, err := ptypes.TimestampProto(diary.UpdatedAt)
	if err != nil {
		return nil, err
	}

	return &DiaryResource{
		Id:        diary.Id,
		Title:     diary.Title,
		Text:      diary.Text,
		CreatedAt: createdAt,
		UpdatedAt: updatedAt,
		Previous:  diary.Previous,
		Next:      diary.Next,
	}, nil
}

func (s *DiaryService) Download(req *DiarySnapshotId, srv Diary_DownloadServer) error {
	var r io.ReadCloser
	r, err := Read(req)
	if err != nil {
		return err
	}
	defer r.Close()

	var b [4096 * 1000]byte
	for {
		n, err := r.Read(b[:])
		if err != nil {
			if err != io.EOF {
				return err
			}
			break
		}
		err = srv.Send(&DiarySnapshot{
			Snapshot: b[:n],
		})
		if err != nil {
			return err
		}
	}
	return nil
}

func (s *DiaryService) Upload(stream Diary_UploadServer) error {
	var w io.WriteCloser
	w, err := GetWriter()
	if err != nil {
		return err
	}
	defer w.Close()

	for {
		res, err := stream.Recv()
		if err == io.EOF {
			break
		}
		if err != nil {
			return err
		}
		w.Write(res.Snapshot)
	}
	return stream.SendAndClose(&empty.Empty{})
}

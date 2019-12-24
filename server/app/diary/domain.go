package diary

import "time"

type Diary struct {
	Id        string
	Title     string
	Text      string
	CreatedAt time.Time
	UpdatedAt time.Time
	Previous  string
	Next      string
}

package file

import (
	"os"
	"path/filepath"
)

func Read(dir string, name string) (*os.File, error) {
	filepath := filepath.Join(dir, name)
	if _, err := os.Stat(filepath); err != nil {
		return nil, err
	}
	f, err := os.Open(filepath)
	if err != nil {
		return nil, err
	}
	return f, nil
}

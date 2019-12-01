package file

import (
	"os"
	"path/filepath"
)

func Read(dir string, name string) (*os.File, error) {
	f, err := os.Open(filepath.Join(dir, name))
	if err != nil {
		return nil, err
	}
	return f, nil
}

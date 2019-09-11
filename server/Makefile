BUILD_DIR=./build
MODULE_NAME=pplate

.PHONY: genpb
genpb:
	cd proto;protoc --go_out=plugins=grpc:../app */*
.PHONY: gendoc
gendoc:
	cd proto;protoc --doc_out=html,index.html:../doc */*
.PHONY: test
test:
	go test -v ./...
.PHONY: build
build:
	go build -o ./build/$(MODULE_NAME) ./cmd/$(MODULE_NAME)/main.go
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)/*
.PHONY: gen
gen:
	go generate ./...

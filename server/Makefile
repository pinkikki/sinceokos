BUILD_DIR=./build
MODULE_NAME=sinceokos

.PHONY: genpb
genpb:
	protoc --go_out=plugins=grpc:./app -Iproto proto/*/*
.PHONY: gendoc
gendoc:
	protoc --doc_out=html,index.html:./doc -Iproto proto/*/*
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

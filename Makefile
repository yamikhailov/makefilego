NAME=$(shell basename $(shell git remote get-url origin) .git)
REGISTRY=yamikhailov
VERSION=1.0.0

deps:
	go mod download


linux: linux/amd64
arm: linux/arm64
macos: darwin/arm64
windows: windows/amd64

linux/amd64: deps
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -v  -o $(NAME)

linux/arm64: deps
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build  -v  -o $(NAME)

darwin/arm64: deps
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build  -v  -o $(NAME)

windows/amd64: deps
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build  -v  -o $(NAME)

image:
	docker build -t $(REGISTRY)/$(NAME):$(VERSION) .	

test:
	go test -v

clean:
	docker rmi $(REGISTRY)/$(NAME):$(VERSION)
	
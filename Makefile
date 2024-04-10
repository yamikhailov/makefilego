NAME=$(shell basename $(shell git remote get-url origin) .git)


deps:
	go mod download

linux/amd64: deps
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -v  -o $(NAME)

linux/arm64: deps
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build  -v  -o $(NAME)

darwin/arm64: deps
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build  -v  -o $(NAME)

windows/amd64: deps
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build  -v  -o $(NAME)


test:
	go test -v

clean:
	rm $(NAME)
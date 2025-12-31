FROM golang:1.25

WORKDIR /usr/src/app

COPY go/excellent .

CMD ["go", "run", "main.go"]
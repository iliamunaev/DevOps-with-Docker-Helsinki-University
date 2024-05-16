FROM golang:1.16

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .

RUN go build -o server

EXPOSE 8080

# Environment variables
ENV PORT=8080

# Run app
CMD ["./server"]



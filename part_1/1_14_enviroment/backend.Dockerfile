FROM ubuntu:latest

WORKDIR /app

COPY . .

# Set environment variables
ENV PATH /usr/local/go/bin:$PATH
ENV REQUEST_ORIGIN http://localhost:5000

# Install dependencies and Go
RUN apt-get update && \
    apt-get install -y wget gcc && \
    rm -rf /usr/local/go && \
    wget -c https://golang.org/dl/go1.16.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz && \
    go version

RUN go build -o server

# Run tests
RUN go test ./...

EXPOSE 8080

CMD ["./server"]

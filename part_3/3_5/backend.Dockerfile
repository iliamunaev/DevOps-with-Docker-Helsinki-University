FROM alpine:latest

# Install dependencies
RUN apk update && \
    apk add --no-cache wget gcc musl-dev go

# Create a non-root user and set it up
RUN adduser -D -g '' myuser

WORKDIR /app

COPY . .

# Change ownership of the working directory
RUN chown -R myuser:myuser /app

# Switch to the non-root user
USER myuser

# Set environment variables
ENV PATH /usr/local/go/bin:$PATH
ENV REQUEST_ORIGIN http://localhost:5000

# Install Go
RUN wget -c https://golang.org/dl/go1.16.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz && \
    go version

# Build the application
RUN go build -o server

# Run tests
RUN go test ./...

EXPOSE 8080

CMD ["./server"]

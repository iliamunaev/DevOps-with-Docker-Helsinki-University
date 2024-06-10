FROM ubuntu:latest

# Create the appuser
RUN useradd  -m appuser

# Set working directory
WORKDIR /app

# Copy all files to the working directory
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

# Change ownership of the working directory and Go installation
RUN chown -R appuser:appuser /app /usr/local/go

# Switch to non-root user
USER appuser

# Build the Go application
RUN go build -o server

# Run tests
RUN go test ./...

EXPOSE 8080

CMD ["./server"]

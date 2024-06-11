FROM ubuntu:latest

# Create a non-root user and set it up
RUN useradd -m appuser

# Set the working directory
WORKDIR /app

# Copy the contents of the current directory to the working directory
COPY . .

# Set environment variables
ENV PATH /usr/local/go/bin:$PATH
ENV REQUEST_ORIGIN http://localhost:5000

# Install dependencies and Go
RUN apt-get update && \
    apt-get install -y wget gcc && \
    wget -c https://golang.org/dl/go1.16.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz && \
    rm go1.16.3.linux-amd64.tar.gz && \
    go version

# Build the Go application
RUN go build -o server .

# Run tests
RUN go test ./...

# Expose the application port
EXPOSE 8080

# Change the owner of current dir to appuser
RUN chown appuser .

# Change the user
USER appuser

# Run the application
CMD ["./server"]

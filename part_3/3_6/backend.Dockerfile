FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy the contents of the current directory to the working directory
COPY . .

# Set environment variables
ENV PATH /usr/local/go/bin:$PATH
ENV REQUEST_ORIGIN http://localhost:5000

# Install dependencies, download and install Go, build and test the application, and clean up
RUN apt-get update && \
    apt-get install -y wget gcc && \
    wget -c https://golang.org/dl/go1.16.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz && \
    rm go1.16.3.linux-amd64.tar.gz && \
    /usr/local/go/bin/go version && \
    /usr/local/go/bin/go build -o server . && \
    /usr/local/go/bin/go test ./... && \
    apt-get purge -y --auto-remove wget gcc && \
    rm -rf /var/lib/apt/lists/*

# Expose the application port
EXPOSE 8080

# Create and set permissions for appuser
RUN useradd -m appuser && chown -R appuser /app

# Change the user to appuser
USER appuser

# Run the application
CMD ["./server"]

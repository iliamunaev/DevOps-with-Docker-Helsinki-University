# Build the Go application
FROM golang:alpine AS builder

WORKDIR /app

COPY . .

# Set environment variable
ENV REQUEST_ORIGIN http://localhost:5000

# Install dependencies and build the Go application
RUN apk add --no-cache gcc musl-dev && \
    go build -o server . && \
    go test ./...

# Create the image
FROM scratch

# Copy the built binary from the builder stage
COPY --from=builder /app/server /server

# Copy necessary CA certificates for HTTPS communication
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

EXPOSE 8080

CMD ["/server"]

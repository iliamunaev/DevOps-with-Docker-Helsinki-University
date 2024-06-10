FROM docker:latest

# Install bash, git
RUN apk add --no-cache bash git

# Copy the script into the container
COPY builder.sh /usr/local/bin/builder.sh

# Make the script executable
RUN chmod +x /usr/local/bin/builder.sh

ENTRYPOINT ["builder.sh"]

FROM ubuntu:latest

WORKDIR /usr/src

# Install dependencies, set up Node.js, and install npm packages
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g serve && \
    node -v && npm -v && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json files and install npm packages
COPY package*.json ./
RUN npm install

# Copy the rest of the application and build static files
COPY . .
RUN npm run build

# Set environment variable
ENV REACT_APP_BACKEND_URL=http://localhost/api

# Expose port 5000
EXPOSE 5000

# Create and set permissions for appuser
RUN useradd -m appuser && chown -R appuser /usr/src

# Change the user to appuser
USER appuser

# Command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]

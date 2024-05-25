FROM ubuntu:latest

WORKDIR /usr/src

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Verify installation
RUN node -v && npm -v

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install packages
RUN npm install

COPY . .

# Set env for backend
ENV REACT_APP_BACKEND_URL=http://localhost/api

# Build static files
RUN npm run build

# Install server
RUN npm install -g serve

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]
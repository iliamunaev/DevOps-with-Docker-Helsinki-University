FROM node:16-alpine

WORKDIR /usr/src/app

COPY package*.json ./

# Install dependencies
RUN npm install

COPY . .

# Build the static files
RUN npm run build

# Install the `serve` package to serve the static files
RUN npm install -g serve

EXPOSE 5000

# Run app
CMD ["serve", "-s", "-l", "5000", "build"]

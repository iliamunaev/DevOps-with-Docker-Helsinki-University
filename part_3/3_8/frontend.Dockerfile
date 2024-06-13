# Stage 1: Build the React application
FROM node:16-alpine AS builder

WORKDIR /usr/src/app

# Copy package.json and package-lock.json files and install npm packages
COPY package*.json ./
RUN npm install

# Copy the rest of the application and build static files
COPY . .
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:1.21.6-alpine

# Copy the build files from the builder stage to the nginx server
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

EXPOSE 5000

CMD ["nginx", "-g", "daemon off;"]

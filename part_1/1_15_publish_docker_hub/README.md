# "Ilia Munaev Hi" App

## Find my project on Docker Hub

https://hub.docker.com/repository/docker/ilyamunaev/ilia-munaev-hi/general

This is a simple FastAPI application. 
Get my LinkedIn profile by running the app.

## Running the Application

To run the application, you need Docker installed on your machine. Follow the instructions below to build and run the Docker container.

### Build the Docker Image

```sh
docker build -t ilyamunaev/ilia-munaev-hi .
```
### Run the Docker Container
    
```sh   
docker run -d -p 8000:8000 ilyamunaev/ilia-munaev-hi
```

### Build the Docker Image
```bash
docker build -t builder .
```
### Run the Docker Container
```bash
docker run -e DOCKER_USER=your_dockerhub_username \
  -e DOCKER_PWD=your_dockerhub_password \
  -v /var/run/docker.sock:/var/run/docker.sock \
  builder iliamunaev/express-app your_dockerhub_username/express-app
```
Replace `your_dockerhub_username`, and `your_dockerhub_password` with your own values.
#!/bin/bash

GITHUB_REPO=$1
DOCKERHUB_REPO=$2

# Extract repo name
REPO_NAME=$(basename "$GITHUB_REPO" .git)

# Clone repo
git clone "https://github.com/$GITHUB_REPO.git"

cd "$REPO_NAME"

# Build Docker image
docker build -t "$DOCKERHUB_REPO:latest" .

# Push image to Docker Hub
docker push "$DOCKERHUB_REPO:latest"

cd ..

# Remove cloned repo
rm -rf "$REPO_NAME"

echo "Done!"

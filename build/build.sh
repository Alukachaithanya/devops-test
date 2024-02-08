#!/bin/bash

# Check if all required arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <docker_username> <docker_image_name> <version> <path_to_dockerfile>"
    exit 1
fi

# Assign command-line arguments to variables
DOCKER_USERNAME="$1"
DOCKER_IMAGE_NAME="$2"
VERSION="$3"
DOCKERFILE_PATH="$4"
IMAGE="$DOCKER_USERNAME/$DOCKER_IMAGE_NAME:$VERSION"

# Build the Docker image
docker build -t "$IMAGE" "$DOCKERFILE_PATH" --no-cache

# Log in to Docker Hub (assuming you're using Docker Hub)
docker login --username "$DOCKER_USERNAME" --password "krishna@AK47"

# Push the Docker image to Docker Hub
docker push "$IMAGE"

# Output the version
echo "************** IMAGE: $IMAGE has been published"

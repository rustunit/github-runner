
IMAGE_NAME:="ghcr.io/rustunit/github-runner"
IMAGE_TAG:="0.2.0"

build:
    docker build -t {{IMAGE_NAME}}:latest .
    docker build -t {{IMAGE_NAME}}:{{IMAGE_TAG}} .

push:
    docker push {{IMAGE_NAME}}
    docker push {{IMAGE_NAME}}:{{IMAGE_TAG}}
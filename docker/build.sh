#!/usr/bin/env bash
LXG_DOCKER_PROJECT="postgrest:v0.4.4.0"

if [ -z ${LXG_DOCKER_REGISTRY} ]; then
    echo 'You must define the environment variable LXG_DOCKER_REGISTRY'
    exit 1
fi

docker build -t ${LXG_DOCKER_REGISTRY}.azurecr.io/${LXG_DOCKER_PROJECT} .
if [ $? -ne 0 ]; then
    exit 1
fi

az acr login --name ${LXG_DOCKER_REGISTRY}
if [ $? -ne 0 ]; then
    exit 1
fi

docker push ${LXG_DOCKER_REGISTRY}.azurecr.io/${LXG_DOCKER_PROJECT}

#!/bin/bash

docker-compose down

# Build "canto-base" image if not present
if [[ "$(docker images -q canto-base 2> /dev/null)" == "" ]]; then
    docker build --no-cache -f Dockerfile.cache -t canto-base .
fi

docker build --no-cache -t canto .
docker build --no-cache -f Dockerfile.desktop -t canto-desktop .
# docker-compose up -d
docker stack deploy dist_ml_framework --compose-file docker-compose.yml 

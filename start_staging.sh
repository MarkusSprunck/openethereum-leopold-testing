#!/usr/bin/env bash

echo "###################################################################################"
echo "# 1. Remove running container and pull latest image"
echo "###################################################################################"

docker-compose down
docker-compose pull

echo "###################################################################################"
echo "# 2. Create Secrets and Configuration"
echo "###################################################################################"

./genKeys.sh -x staging

echo "###################################################################################"
echo "# 3. Start Docker"
echo "###################################################################################"

echo 'PWD='$(pwd)'' > .env
docker-compose up -d
#!/usr/bin/env bash

echo "###################################################################################"
echo "# 1. Remove running container and pull latest image"
echo "###################################################################################"

docker pull --platform linux/x86_64 ihkmunich/openethereum:v3.5.1
docker pull --platform linux/x86_64 ihkmunich/c4t-metrics:7.0.1

docker-compose down

echo "###################################################################################"
echo "# 2. Create Secrets and Configuration"
echo "###################################################################################"

./genKeys.sh -x staging

echo "###################################################################################"
echo "# 3. Start Docker"
echo "###################################################################################"

echo 'PWD='$(pwd)'' > .env
docker-compose up -d

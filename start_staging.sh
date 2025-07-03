#!/usr/bin/env bash

echo "###################################################################################"
echo "# 1. Remove running container and pull latest image"
echo "###################################################################################"

docker pull --platform linux/x86_64 ihkmuenchen/openethereum:latest-rust-1.85
docker pull --platform linux/x86_64 ihkmuenchen/c4t-metrics:6.9.0

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

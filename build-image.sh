#!/bin/bash

git pull

sleep 5s

docker-compose stop
docker-compose rm -f
docker images | grep ^fluentdelasticsearchkibana | awk '{print $3}' | xargs docker rmi
docker images | grep ^'<none>' | awk '{print $3}' | xargs docker rmi

docker build -t fluentd ./fluentd
docker build -t nginx ./nginx

docker-compose up -d elasticsearch fluentd kibana
docker-compose up -d nginx1

docker-compose logs -f
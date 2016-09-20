#!/bin/bash

git pull

sleep 5s

docker-compose stop
docker-compose rm -f
docker images | grep ^dockerpfsenseelk | awk '{print $3}' | xargs docker rmi
docker images | grep ^'<none>' | awk '{print $3}' | xargs docker rmi

docker build -t fluentd ./fluentd


docker-compose up -d elasticsearch fluentd kibana


docker-compose logs -f
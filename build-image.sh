#!/bin/bash

git pull

sleep 5s

docker-compose stop
docker-compose rm -f
docker images | grep ^dockerpfsensefek | awk '{print $3}' | xargs docker rmi
docker images | grep ^'<none>' | awk '{print $3}' | xargs docker rmi

docker-compose up -d
docker-compose logs -f
#!/bin/bash

git pull

sleep 5s

docker-compose stop
docker-compose rm -f logstash
docker images | grep ^dockerpfsensefek_logstash | awk '{print $3}' | xargs docker rmi
docker images | grep ^'<none>' | awk '{print $3}' | xargs docker rmi

docker build --no-cache -t dockerpfsensefek_logstash logstash

docker-compose up
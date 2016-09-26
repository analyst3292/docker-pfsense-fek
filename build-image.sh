#!/bin/bash

git pull

sleep 5s

#docker-compose stop
#docker-compose rm -f fluent elasticsearch
#docker images | grep ^dockerpfsensefek_fluent | awk '{print $3}' | xargs docker rmi
#docker images | grep ^'<none>' | awk '{print $3}' | xargs docker rmi

#docker build --no-cache -t dockerpfsensefek_logstash logstash

#docker-compose rm -f
#docker-compose up

docker images | grep ^dockerpfsensefek_fluent | awk '{print $3}' | xargs docker rmi
docker images | grep ^'<none>' | awk '{print $3}' | xargs docker rmi

docker build -t dockerpfsensefek_fluent fluent

docker run --rm -it \
	--name fl \
	-p "5514:5514/udp" \
	-e TIMEZONE="Asia/Tokyo" \
	dockerpfsensefek_fluent
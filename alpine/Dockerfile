FROM logstash:latest

MAINTAINER airforon <github@air-foron.com>

RUN \
       apt-get update \
    && apt-get install -y ruby-full \
    && rm -rf /var/lib/apt/lists/* \
    && gem update \
    && gem cleanup \
    && apt-get purge gem
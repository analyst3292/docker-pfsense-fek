FROM openjdk:8-jre-alpine

MAINTAINER airforon <github@air-foron.com>

ARG logstash_VERSION=2.4.0
ENV PATH /opt/logstash/bin:$PATH
ENV LS_SETTINGS_DIR /etc/logstash

RUN \
       apk add --no-cache ruby \ 
    && apk add --no-cache --virtual .build-logstash \
            ca-certificates \
            curl \
            coreutils \
            tar \
    && mkdir -p /usr/src \
    && curl -fSL https://download.elastic.co/logstash/logstash/logstash-$logstash_VERSION.tar.gz \
        -o /usr/src/logstash-$logstash_VERSION.tar.gz \
    && curl -fSL https://download.elastic.co/logstash/logstash/logstash-$logstash_VERSION.tar.gz.sha1.txt \
        -o logstash-$logstash_VERSION.tar.gz.sha1.txt \
    && mkdir -p /opt/logstash \
    && echo "`cat logstash-$logstash_VERSION.tar.gz.sha1.txt` *logstash-$logstash_VERSION.tar.gz" | sha1sum -c - \
    && tar xzf /usr/src/logstash-$logstash_VERSION.tar.gz -C /opt/logstash --strip=1 \
    && apk del .build-logstash


# comment out some troublesome configuration parameters
#   path.log: logs should go to stdout
#   path.config: No config files found: /etc/logstash/conf.d/*
RUN set -ex \
	&& if [ -f "$LS_SETTINGS_DIR/logstash.yml" ]; then \
		sed -ri 's!^(path.log|path.config):!#&!g' "$LS_SETTINGS_DIR/logstash.yml"; \
	fi

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-e", ""]
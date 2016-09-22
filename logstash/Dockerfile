FROM logstash:latest

MAINTAINER airforon <github@air-foron.com>

RUN \
       curl -fSL https://gist.githubusercontent.com/bradvido/4e6501222b8f7dbe3ba8/raw/pfsense2-2.grok \
            -o /etc/logstash/conf.d/patterns \
    && mkdir -p /etc/logstash/GeoLite \
    && curl -fSL http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz \
        -o /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && rm -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz


COPY conf /etc/logstash/conf.d

EXPOSE 5514/udp

CMD ["logstash","-f", "/etc/logstash/conf.d/*.logstash.conf"]
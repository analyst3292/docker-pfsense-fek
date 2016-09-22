FROM logstash:latest

MAINTAINER airforon <github@air-foron.com>

RUN \
       mkdir -p /etc/logstash/GeoLite \
    && curl -fSL http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz \
        -o /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && rm -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz


COPY conf /etc/logstash/conf.d

EXPOSE 5514/udp

CMD ["logstash","-f", "/etc/logstash/conf.d/*.logstash.conf"]
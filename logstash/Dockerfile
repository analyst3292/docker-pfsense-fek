FROM logstash:latest

MAINTAINER airforon <github@air-foron.com>

RUN \
    curl -fSL https://gist.githubusercontent.com/FoxBoxsnet/9eace3da1cd77f91ada5b55a5ebfd73c/raw/d2ad232531fd6095b42ce2bd7a469db07d2e5e65/pfsense2-2.grok \
        -o /etc/logstash/patterns \
    \
    && mkdir -p /etc/logstash/GeoLite \
    && curl -fSL http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz \
        -o /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && rm -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz


COPY conf /etc/logstash/conf.d

EXPOSE 5514/udp

CMD ["logstash","-f", "/etc/logstash/conf.d/*.conf"]
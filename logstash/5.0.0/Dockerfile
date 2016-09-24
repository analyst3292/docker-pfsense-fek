FROM logstash:5.0.0

MAINTAINER airforon <github@air-foron.com>

RUN \
    curl -fSL https://gist.githubusercontent.com/FoxBoxsnet/9eace3da1cd77f91ada5b55a5ebfd73c/raw/pfsense2-2.grok \
        -o /etc/logstash/patterns \
    \
    && mkdir -p /etc/logstash/GeoLite \
    # GeoLite City IPv4
    && curl -fSL http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz \
        -o /etc/logstash/GeoLite/GeoLiteCity.dat.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoLiteCity.dat.gz \
    && rm -f /etc/logstash/GeoLite/GeoLiteCity.dat.gz \
    \
    # GeoLite City IPv6 (Bata)
    && curl -fSL http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz \
        -o /etc/logstash/GeoLite/GeoLiteCityv6.dat.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoLiteCityv6.dat.gz \
    && rm -f /etc/logstash/GeoLite/GeoLiteCityv6.dat.gz \
    \
    # GeoLite ASN(Autonomous System Numbers) IPv4
    && curl -fSL http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz \
        -o /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    && rm -f /etc/logstash/GeoLite/GeoIPASNum.dat.gz \
    \
    # GeoLite ASN(Autonomous System Numbers) IPv6
    && curl -fSL http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNumv6.dat.gz \
        -o /etc/logstash/GeoLite/GeoIPASNumv6.dat.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoIPASNumv6.dat.gz \
    && rm -f /etc/logstash/GeoLite/GeoIPASNumv6.dat.gz


COPY conf /etc/logstash/conf.d

EXPOSE 5514/udp

CMD ["logstash","-f", "/etc/logstash/conf.d/*.logstash.conf"]
FROM logstash:5.0.0

MAINTAINER airforon <github@air-foron.com>

RUN \
#       logstash-plugin install logstash-filter-cidr \
       curl -fSL https://gist.githubusercontent.com/FoxBoxsnet/9eace3da1cd77f91ada5b55a5ebfd73c/raw/pfsense2-2.grok \
        -o /etc/logstash/patterns \
    \
    && mkdir -p /etc/logstash/GeoLite \
    # GeoLite2 City
    && curl -fSL http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz \
        -o /etc/logstash/GeoLite/GeoLite2-City.mmdb.gz \
    && gunzip -f /etc/logstash/GeoLite/GeoLite2-City.mmdb.gz \
    && rm -f /etc/logstash/GeoLite/GeoLite2-City.mmdb.gz

COPY conf /etc/logstash/conf.d
COPY docker-entrypoint.sh /

EXPOSE 5514/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash","-f", "/etc/logstash/conf.d/*.logstash.conf"]
FROM fluent/fluentd:latest


ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root
RUN \
	   apk add --no-cache curl \
	&& apk add --no-cache --virtual .build-gem \
            git \
    && gem install specific_install \
    && gem specific_install -l 'git://github.com/FoxBoxsnet/fluent-plugin-filter-geo.git' \
	&& gem specific_install -l 'git://github.com/FoxBoxsnet/fluent-plugin-protocols-filter.git' \
	&& gem install fluent-plugin-secure-forward \
	&& gem install fluent-plugin-elasticsearch \
	&& gem install fluent-plugin-grok-parser \
	&& gem install fluent-plugin-ignore-filter \
	&& gem install fluent-plugin-resolv-filter \
#	&& gem install fluent-plugin-geoip-filter \
	\
	&& apk del .build-gem

EXPOSE 5140/udp

USER fluent
COPY /fluent.conf /fluentd/etc/
COPY /conf.d /fluentd/etc/conf.d
COPY docker-entrypoint.sh /

WORKDIR /home/fluent
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins -vv
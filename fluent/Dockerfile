FROM fluent/fluentd:latest


ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root

COPY /fluent.conf /docker-entrypoint.sh /fluentd/etc/
COPY /mapping /fluentd/etc/mapping/
COPY /conf.d /fluentd/etc/conf.d/
WORKDIR /home/fluent

RUN \
	   apk add --no-cache \
	   		curl \
			bash \
			coreutils \
	&& apk add --no-cache --virtual .build-gem \
            git \
	&& chown -R fluent:fluent /fluentd/etc/ \
    && gem install specific_install \
    && gem specific_install -l 'git://github.com/FoxBoxsnet/fluent-plugin-filter-geo.git' \
#	&& gem specific_install -l 'git://github.com/FoxBoxsnet/fluent-plugin-protocols-filter.git' \
	&& gem install fluent-plugin-secure-forward \
	&& gem install fluent-plugin-elasticsearch \
	&& gem install fluent-plugin-grok-parser \
	&& gem install fluent-plugin-ignore-filter \
	&& gem install fluent-plugin-resolv-filter \
	&& gem install fluent-plugin-protocols-filter \
	\
	&& apk del .build-gem

EXPOSE 5140/udp

ENTRYPOINT [ "/fluentd/etc/docker-entrypoint.sh" ]
USER fluent
CMD [ "fluentd", "-c", "/fluentd/etc/fluent.conf", "-p", "/fluentd/plugins", "-vv" ]
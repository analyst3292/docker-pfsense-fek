FROM fluent/fluentd:latest


ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root
WORKDIR /home/fluent

RUN \
	   apk add --no-cache \
	   		curl \
			bash \
			coreutils \
	&& apk add --no-cache --virtual .build-gem \
			git \
			ruby-dev \
			build-base \
	&& chown -R fluent:fluent /fluentd/etc/ \
	&& gem install fluent-plugin-filter-geo \
	&& gem install fluent-plugin-secure-forward \
	&& gem install fluent-plugin-elasticsearch \
	&& gem install fluent-plugin-grok-parser \
	&& gem install fluent-plugin-ignore-filter \
	&& gem install fluent-plugin-resolv-filter \
	&& gem install fluent-plugin-protocols-filter \
	\
	&& apk del .build-gem

EXPOSE 5140/udp

COPY /fluent.conf /docker-entrypoint.sh /fluentd/etc/
COPY /mapping /fluentd/etc/mapping/
COPY /conf.d /fluentd/etc/conf.d/

ENTRYPOINT [ "/fluentd/etc/docker-entrypoint.sh" ]
USER fluent
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
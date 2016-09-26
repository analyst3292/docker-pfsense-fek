FROM fluent/fluentd:latest


ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER fluent
RUN \
	   gem install fluent-plugin-secure-forward \
	&& gem install fluent-plugin-elasticsearch \
	&& gem install fluent-plugin-rewrite-tag-filter \
	&& gem install fluent-plugin-geoip-filter \
	&& gem install fluent-plugin-grok-parser

EXPOSE 5514/udp

COPY conf/ /fluentd/etc/
#COPY plugins/ 

WORKDIR /home/fluent
CMD fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins -vv
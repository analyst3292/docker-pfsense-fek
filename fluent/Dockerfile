FROM fluent/fluentd:latest-onbuild

ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

RUN \
	   gem install fluent-plugin-secure-forward \
	&& gem install fluent-plugin-elasticsearch \
	&& gem install fluent-plugin-rewrite-tag-filter \
	&& gem install fluent-plugin-geoip-filter

EXPOSE 5514/udpu

COPY conf/fluent.conf conf/patterns /home/fluent/fluentd/etc/

WORKDIR /home/fluent
CMD fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins -vv
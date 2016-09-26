FROM fluent/fluentd:latest-onbuild

WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

RUN \
	   gem install fluent-plugin-secure-forward \
	&& gem install fluent-plugin-elasticsearch \
	&& gem install fluent-plugin-rewrite-tag-filter \
	&& gem install fluent-plugin-geoip-filter \
	&& pwd \
	&& ls -la

EXPOSE 5514/udpu

# COPY /conf/fluent.conf /conf/patterns /home/fluent/fluentd/etc/


CMD fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins -vv
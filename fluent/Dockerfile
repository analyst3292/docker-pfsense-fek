FROM fluent/fluentd:latest-onbuild

WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root
RUN \
	   gem install fluent-plugin-secure-forward \
	&& gem install fluent-plugin-elasticsearch \
	&& gem install fluent-plugin-rewrite-tag-filter \
	&& gem install fluent-plugin-geoip-filter

EXPOSE 5514/udpu

COPY conf/* /fluentd/etc/

USER fluent
CMD fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins -vv
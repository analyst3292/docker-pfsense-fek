FROM elasticsearch

MAINTAINER airforon <github@air-foron.com>

RUN \
	   bin/plugin install mobz/elasticsearch-head

EXPOSE 9200

CMD  ["bin/elasticsearch", "-Des.insecure.allow.root=true"]

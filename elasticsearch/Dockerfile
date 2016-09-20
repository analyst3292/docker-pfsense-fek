FROM elasticsearch

MAINTAINER airforon <github@air-foron.com>

RUN \
	   bin/plugin install lmenezes/elasticsearch-kopf/master

EXPOSE 9200

CMD  ["bin/elasticsearch", "-Des.insecure.allow.root=true"]

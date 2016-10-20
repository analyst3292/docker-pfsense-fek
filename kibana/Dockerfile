FROM kibana:latest

MAINTAINER airforon <github@air-foron.com>
ENV NODE_OPTIONS="--max-old-space-size=256"
RUN \
	   kibana plugin --install elastic/sense

COPY ./homesoc.tokyo-white.svg /opt/kibana/optimize/bundles/src/ui/public/images/kibana.svg
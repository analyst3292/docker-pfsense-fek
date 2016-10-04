#!/bin/bash
#//==============================================
#// docker-entrypoint.sh
#//==============================================

MAPPING_FILE=/fluentd/etc/conf.d/pfsense-mapping.json

	curl -X PUT elasticsearch:9200/_template/pfsense --data @$MAPPING_FILE

#//==============================================
#// start fluentd
#//==============================================
exec "$@"
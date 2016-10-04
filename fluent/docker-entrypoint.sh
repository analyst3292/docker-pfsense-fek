#!/bin/bash
#//==============================================
#// docker-entrypoint.sh
#//==============================================

MAPPING_FILE=/fluentd/etc/conf.d/pfsense-mapping.json

echo "MAPPING : $MAPPING_FILE"
curl -X PUT elasticsearch:9200/_template/pfsense --data @$MAPPING_FILE
curl -X GET elasticsearch:9200/_template/pfsense

#//==============================================
#// start fluentd
#//==============================================
exec "$@"
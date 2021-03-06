#!/bin/bash
#//==============================================
#// docker-entrypoint.sh
#//==============================================

MAPPING_FILE=/fluentd/etc/mapping/pfsense-mapping.json

echo "Sleep 30s"
sleep 30
echo "MAPPING : $MAPPING_FILE"
curl -X PUT elasticsearch:9200/_template/pfsense --data @$MAPPING_FILE
curl -X GET elasticsearch:9200/_template/pfsense

#//==============================================
#// start fluentd
#//==============================================
exec "$@"
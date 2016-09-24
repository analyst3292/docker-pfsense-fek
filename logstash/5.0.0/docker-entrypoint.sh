#!/bin/bash

set -e
CONFIG_FILE=/etc/logstash/conf.d/11-pfsense.logstash.conf

if [ -n "$NODE_RACK" ];then
    sed -e '/^      timezone => "UTC"/c       timezone => "$TIMEZONE"' \
        -i.bk $CONFIG_FILE
fi


# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" = 'logstash' ]; then
	set -- gosu logstash "$@"
fi

exec "$@"
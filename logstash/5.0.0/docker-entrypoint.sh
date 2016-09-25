#!/bin/bash

set -e
CONFIG_FILE=/etc/logstash/conf.d/10-pf.filter.logstash.conf

if [ -n "$TIMEZONE" ];then
	echo "TIMEZONE change : UTC => $TIMEZONE."
    sed -e "s@"UTC"@"$TIMEZONE"@" -i.bk $CONFIG_FILE
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
#!/bin/bash

set -e
CONFIG_FILE=/etc/logstash/conf.d/11-pfsense.logstash.conf

if [ -n "$TIMEZONE" ];then
	echo "TIMEZONE change : UTC => $TIMEZONE."
    sed -e "s@"UTC"@"$TIMEZONE"@" -i.bk $CONFIG_FILE
fi

if [ -n "$ADDR_IPV4" ];then
    sed -e "s@"ADDR_IPV4"@"$ADDR_IPV4"@" -i.bk $CONFIG_FILE
fi

if [ -n "$ADDR_IPV6" ];then
    sed -e "s@"ADDR_IPV6"@"$ADDR_IPV6"@" -i.bk $CONFIG_FILE
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
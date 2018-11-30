#!/bin/sh

sleep 5
# run a first ping
/bin/sh /ping_script.sh

# start cron
/usr/sbin/crond -f -l 8


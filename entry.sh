#!/bin/sh

sleep 20

# run a first ping
sh /ping_script.sh

# start cron
/usr/sbin/crond -f -l 8


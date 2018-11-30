#!/bin/sh

# start cron
/usr/sbin/crond -f -l 8

sleep 20

# run a first ping
sh /ping_script.sh

#!/bin/sh

sleep 20
# run a first ping
/bin/sh /config/ping_script.sh

# run a first speedtest and clean output
/bin/bash /config/speedtest.sh

# start cron
/usr/sbin/crond -f -l 8


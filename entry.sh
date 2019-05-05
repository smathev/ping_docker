#!/bin/sh

sleep 20
# run a first ping
/bin/sh /config/ping_script.sh

# run a first speedtest and clean output
/usr/bin/speedtest-cli --csv > /config/speedtest.csv
/bin/sh /config/speedtest_output.sh

# start cron
/usr/sbin/crond -f -l 8


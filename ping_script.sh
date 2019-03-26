#!/bin/bash

host=http://www.google.com

log_file=log
reaction_file=working
ip_file=ip

wget -q --tries=10 --timeout=20 --spider $host
if [ $? -eq 0 ]; 
    then
        echo "connection UP - $(date)" > $log_file
        wget -qqO- 'https://duckduckgo.com/?q=what+is+my+ip' \
        | grep -Pow 'Your IP address is \K[0-9.]+' > $ip_file
        touch $reaction_file
else
        echo "connection DOWN - $(date)" > $log_file
        rm -rf $reaction_file
fi

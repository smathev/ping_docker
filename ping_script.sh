#!/bin/bash

host=http://www.google.com

log_file=/config/log
reaction_file=/config/working

wget -q --tries=10 --timeout=20 --spider $host
if [ $? -eq 0 ]; 
    then
        echo "connection UP - $(date)" > $log_file
        touch $reaction_file
else
        echo "connection DOWN - $(date)" > $log_file
        rm -rf $reaction_file
fi

#!/bin/sh
host=www.google.com

count=$(cat /config/ping_count.txt)

packet_loss=$(ping -c $count -q $host | grep -oP '\d+(?=% packet loss)')
received_packets=$(( 100 - $packet_loss ))

threshold=60

rcd_pck=$received_packets

if [ $rcd_pck -gt $threshold ]
    then
     echo "reply working - $(date +%F)" > /config/working.txt
 else
     rm -rf /config/ping_working.txt
fi

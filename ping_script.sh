#!/bin/bash

host=http://www.google.com

log_file=/config/log
reaction_file=/config/working
ip_file=/config/ip

pingCheckCommand () {
wget -qqO- 'https://duckduckgo.com/?q=what+is+my+ip' | grep -Pow 'Your IP address is \K[0-9.]+' > $ip_file
}

switchVpnConf () {
find /home/core/.docker/configs/mullvad_vpn-client/mullvad_config_files/ -type f | shuf -n 1 | xargs cp  -t /home/core/.docker/configs/mullvad_vpn-client/act.Cert/vpn.conf
}

wget -q --tries=10 --timeout=20 --spider $host
if [ $? -eq 0 ]; 
    then
        echo "connection UP - $(date)" > $log_file
        pingCheckCommand
        touch $reaction_file
else
        echo "connection DOWN - $(date)" > $log_file
        switchVpnConf
        rm -rf $reaction_file
fi

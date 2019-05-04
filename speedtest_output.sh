#!/bin/bash

divideBy=8000000

speedTestLocation=/config/speedtest.csv

DLspeed=$(awk -F "\"*,\"*" '{print $7}' $speedTestLocation | cut -d. -f1 )
ULspeed=$(awk -F "\"*,\"*" '{print $8}' $speedTestLocation | cut -d. -f1)

DLspeed=$((DLspeed / divideBy))" MB/S DL"
ULspeed=$((ULspeed / divideBy))" MB/S UL"

printf "%3s " $DLspeed  
printf "\n"
printf "%3s " $ULspeed 

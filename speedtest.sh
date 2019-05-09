#!/bin/bash

divideBy=8000000

speedTestLocation=./.speedtest_results

if [ ! -d $speedTestLocation ]; then
  mkdir -p $speedTestLocation;
fi
speedTest1=$speedTestLocation/speedtest1.csv
speedTest2=$speedTestLocation/speedtest2.csv
speedTest3=$speedTestLocation/speedtest3.csv

speedTestFiles=( $speedTest1 $speedTest2 $speedTest3 )

dt=$(date '+%d/%m/%Y %H:%M:%S')
time=$(date '+%H:%M:%S')
echo $dt
for file in ${speedTestFiles[@]}
do
    time=$(date +"%T")
    speedtest-cli --csv > $file
     
    getDLSpeed=$(awk -F "\"*,\"*" '{print $7}' $file | cut -d. -f1 )
    getULSpeed=$(awk -F "\"*,\"*" '{print $8}' $file | cut -d. -f1)
    DLspeedToMBs=$((getDLSpeed / divideBy))
    ULspeedToMBs=$((getULSpeed / divideBy))
    formatDLspeed="$DLspeedToMBs DL "
    formatULspeed="$ULspeedToMBs UL "

    output="$formatDLspeed $formatULspeed"
    echo -e "$time"
    echo -e $output "MB/s" | column
    if [ $DLspeedToMBs -gt 28 ]; then
        break
    fi
done

echo "#################"

#printf "\n"
#printf "%3s " $dt
#printf "\n"


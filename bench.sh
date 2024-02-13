#!/bin/bash

set -euxo pipefail

num_requests=200
sleep_time=5

url1=https://radiant-plains-50820-24a7748ea519.herokuapp.com/frames
url2=https://again473298432-0852584903c1.herokuapp.com/frames

echo "Will run experiment 1"
sleep $sleep_time

ab -n $num_requests -c 1 -k -v 2 -g /tmp/raw $url1 2>/dev/null | tee /tmp/log | grep ^HTTP
cp /tmp/raw url1-full-exp1.csv
cp /tmp/log url1-full-exp1.log

echo "Will run experiment 2"
sleep $sleep_time

ab -n $num_requests -c 1 -k -v 2 -g /tmp/raw -H "Turbo-Frame: part-1" $url1 2>/dev/null | tee /tmp/log | grep ^HTTP
cp /tmp/raw url1-turbo-frame-exp1.csv
cp /tmp/log url1-turbo-frame-exp1.log

echo "Will run experiment 3"
sleep $sleep_time

ab -n $num_requests -c 1 -k -v 2 -g /tmp/raw $url2 2>/dev/null | tee /tmp/log | grep ^HTTP
cp /tmp/raw url2-full-exp1.csv
cp /tmp/log url2-full-exp1.log

echo "Will run experiment 4"
sleep $sleep_time

ab -n $num_requests -c 1 -k -v 2 -g /tmp/raw -H "Turbo-Frame: part-1" $url2 2>/dev/null | tee /tmp/log | grep ^HTTP
cp /tmp/raw url2-turbo-frame-exp1.csv
cp /tmp/log url2-turbo-frame-exp1.log

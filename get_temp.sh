#!/bin/bash
#set -x
set -e

wget -N 192.168.1.219 &>/dev/null

timestamp=$(date)
CEL=$(cat index.html |grep -A 1 'TEMP' |grep -v 'TEMP\|--')
HUMID=$(cat index.html |grep -A 1 'HUMID' |grep -v 'HUMID\|--')

echo "$timestamp     $CEL      $HUMID" |tr -d '\r'|tee -a /var/www/html/output.txt

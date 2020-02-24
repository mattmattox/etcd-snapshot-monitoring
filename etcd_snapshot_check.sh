#!/bin/bash
nginx
while true
do
  cd /opt/rke/etcd-snapshots
  TimeOfLastBackup=`date -u '+%s' -d "$(ls -t *.zip | head -n1 | awk -F '_' '{print $2}')"`
  CurrentTime=`date -u '+%s'`
  echo "$CurrentTime - $TimeOfLastBackup" | bc > /var/www/html/index.html
  sleep 60
done

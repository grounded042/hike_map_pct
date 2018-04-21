#!/bin/bash

source ./.env

cd "$(dirname "$0")"
DATE=`date +%Y-%m-%d:%H:%M:%S`

echo "======================================"
echo "starting work for $DATE"
echo "======================================"

./hike_map_translator -s garmin -u "https://share.delorme.com/feed/share/joncarl?d1=2018-01-01T00:00Z" -d "04/23/2018" -e "11/01/2018" -n "PCT 2018" -p $GARMIN_PASSWORD

if [[ `git status --porcelain` ]]; then
  # Changes
  git add .
  git commit -m "adding data for $DATE"
  git push origin master
else
  # No changes
  echo "no changes on $DATE"
fi

echo "======================================"
echo "finished work for $DATE"
echo "======================================"


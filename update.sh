#!/bin/bash

./hike_map_translator -s garmin -u "https://share.delorme.com/feed/share/joncarl?d1=2018-01-01T00:00Z" -d "04/01/2018" -e "11/01/2018" -n "PCT 2018"

DATE=`date +%Y-%m-%d:%H:%M:%S`

if [[ `git status --porcelain` ]]; then
  # Changes
  git add .
  git commit -m "adding data for $DATE"
else
  # No changes
  echo "no changes on $DATE" >> log.txt
fi


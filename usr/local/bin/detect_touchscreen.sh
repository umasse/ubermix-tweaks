#!/bin/bash
TOUCHID=12
DETECTID=`xinput list | grep SIS0457 | awk '{print $5}' | grep id | cut -d'=' -f2`

echo "Detected $DETECTID"

if [ -f /etc/touchscreen_id.txt ]; then
    TOUCHID=`cat /etc/touchscreen_id.txt`
fi
if [ ! -f /etc/touchscreen_id.txt ]; then
    echo $TOUCHID > /etc/touchscreen_id.txt
fi

if [ $DETECTID ]; then
  if [ ! $TOUCHID = $DETECTID ]; then
    echo "Needs updating"
    echo $DETECTID > /etc/touchscreen_id.txt
  fi
fi

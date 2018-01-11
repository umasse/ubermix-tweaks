#!/bin/bash
# IF THERE ARE TWO USERS LOGGED IN, THIS WILL NOT WORK!
#USERNAME=`w -h -s | awk '{print $1;}'
USERS=`users`

logger -s -p user.info "BIS Touchscreen wakeup start"

# Touchscreen ID seems to be always 12
TOUCHID=12
if [ -f /etc/touchscreen_id.txt ]; then
    TOUCHID=`cat /etc/touchscreen_id.txt`
fi

for utmp in $USERS  
do
    XTMP=/home/$utmp/.Xauthority
    chmod a+r $XTMP
    DISPTMP=`w -h -s | grep $utmp | awk '{print $3};'`
    logger -s -p user.info "BIS Touchscreen $TOUCHID waking: Display:$DISPTMP Xauthority:$XTMP"
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xinput disable $TOUCHID
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xinput enable $TOUCHID
done

logger -s -p user.info "BIS Touchscreen Sleeping 5 seconds"
sleep 5s
for utmp in $USERS  
do
    XTMP=/home/$utmp/.Xauthority
    chmod a+r $XTMP
    DISPTMP=`w -h -s | grep $utmp | awk '{print $3};'`
    logger -s -p user.info "BIS Touchscreen $TOUCHID waking: Display:$DISPTMP Xauthority:$XTMP"
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xinput disable $TOUCHID
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xinput enable $TOUCHID
done

logger -s -p user.info "BIS Touchscreen Sleeping 5 seconds more"
sleep 5s
for utmp in $USERS  
do
    XTMP=/home/$utmp/.Xauthority
    chmod a+r $XTMP
    DISPTMP=`w -h -s | grep $utmp | awk '{print $3};'`
    logger -s -p user.info "BIS Touchscreen $TOUCHID waking: Display:$DISPTMP Xauthority:$XTMP"
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xinput disable $TOUCHID
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xinput enable $TOUCHID
done

logger -s -p user.info "BIS Touchscreen finished wakeup"


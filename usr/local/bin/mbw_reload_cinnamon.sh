#!/bin/bash
# IF THERE ARE TWO USERS LOGGED IN, THIS WILL NOT WORK!
#USERNAME=`w -h -s | awk '{print $1;}'
USERS=`w -h -s | grep cinnamon | awk '{print $1}' | sort -u`

logger -s -p user.info "BIS MBwhite Reload Cinnamon wakeup start"

for utmp in $USERS
do
    XTMP=/home/$utmp/.Xauthority
    chmod a+r $XTMP
    DISPTMP=`w -h -s | grep $utmp | grep cinnamon | awk '{print $3}'`
    if [ -z "$DISPTMP" ]; then
        DISPTMP=":0"
    fi
    logger -s -p user.info "BIS MBwhite Reload Cinnamon: Display:$DISPTMP Xauthority:$XTMP"

    CINNAMONPID=`ps axu | grep $utmp | grep "cinnamon --replace" | grep -v grep | awk '{print $2}'`
    CINNAMONLAUNCHERPID=`ps axu | grep $utmp | grep "cinnamon-launcher" | grep -v grep | awk '{print $2}'`

    kill -9 $CINNAMONLAUNCHERPID
    kill -9 $CINNAMONPID

    ( su $utmp -c "cinnamon --replace --display=$DISPTMP" ) &

    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xrandr --output LVDS-1 --mode 1024x768
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xrandr -s 1024x768
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xrandr -s 1280x800
    DISPLAY=$DISPTMP XAUTHORITY=$XTMP xrandr --output LVDS-1 --mode 1280x800

    disown
done

logger -s -p user.info "BIS MBwhite Reload Cinnamon wakeup finished"


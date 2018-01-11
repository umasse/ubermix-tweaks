#!/bin/bash

# Misc fixes for after sleeping for BIS models
logger -p user.info "BIS After Sleep Fixes starting"

HWMODEL=`dmidecode -t 1 | grep -F "Product Name:" | cut -d' ' -f 3-`
logger -p user.info "BIS After Sleep: Detected '$HWMODEL'"

# For Asus E205SA
if [ $HWMODEL = "E205SA" ]; then
    nohup /usr/local/bin/reload_touchscreen.sh &
fi

# For MacBook7,1
if [ $HWMODEL = "MacBook7,1" ]; then
    (/usr/local/bin/mbw_reload_cinnamon.sh > /dev/null) &

    # Unload and reload wireless
    modprobe -r brcmsmac
    sleep 1s
    modprobe brcmsmac
    service network-manager restart
fi

#!/bin/bash
gsettings set org.cinnamon.desktop.background picture-options 'zoom'
HOSTNAME=$(cat /etc/hostname)
if [[ "$HOSTNAME" =~ ^Cart.+$ ]]; then
    gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/local/share/bis/bis-wallpaper-cart.jpg'
else
    gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/local/share/bis/bis-wallpaper.jpg'
fi

HWMODEL=`/usr/local/bin/print-computer-model-name`
if [ "${HWMODEL}" == "E205SA" ]; then
    /usr/local/bin/touch-setup
    nmcli connection up bisopen
    nmcli connection modify bisopen connection.autoconnect true
fi

if [ "${HWMODEL}" == "Inspiron13-5378" ]; then
    /usr/local/bin/touch-setup
fi

if [ "${HWMODEL}" == "iMac11,2" ]; then
  # Check if this iMac has a Radeon HD 4670
  if [[ $(lspci -nn | grep "\[1002:9488\]") ]]; then
    xrandr --output eDP --crtc 1 --brightness 0.8
  fi
fi

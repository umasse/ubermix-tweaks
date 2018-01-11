#!/bin/bash

echo
echo -n "Cleaning home folder..."
rm -rf /home/user/user.tar.gz /home/user/mods.tar.gz /home/user/.cache >/dev/null 2>&1
find /home/user/.mozilla/firefox/ -maxdepth 2 -name *Cache* -exec rm -rf {} \;
find /home/user/.mozilla/firefox/ -maxdepth 2 -name *.sqlite -exec rm -rf {} \;
find /home/user/.config/google-chrome/ -maxdepth 2 -name *History* -exec rm -rf {} \;
find /home/user/.config/google-chrome/ -maxdepth 2 -name *Current* -exec rm -rf {} \;
find /home/user/.config/google-chrome/ -maxdepth 2 -name *Thumbnails* -exec rm -rf {} \;
find /home/user/.config/google-chrome/ -maxdepth 2 -name *Visited* -exec rm -rf {} \;
find /home/user/.config/google-chrome/ -maxdepth 2 -name *Web\ Data* -exec rm -rf {} \;
find /home/user/.config/google-chrome/ -maxdepth 2 -name *Cookies* -exec rm -rf {} \;
rm -rf /home/user/.config/google-chrome/SingletonLock
rm -rf /home/user/.googleearth/Temp/*
rm -rf /home/user/.local/share/gvfs-metadata/*
rm -rf /home/user/.icedtea/cache/*
rm -rf /home/user/.cache
rm -rf /home/user/.Skype
rm -rf /home/user/.bash_history 
rm -rf /home/user/.local/share/Trash/*
rm -rf /home/user/.local/share/recently-used.xbel
rm -rf /home/user/.local/share/zeitgeist/*
rm -rf /home/user/.googleearth/Cache
rm -rf /home/user/.recently-used.xbel
rm -rf /home/user/.thunderbird
rm -rf /home/user/.pulse
rm -rf /home/user/.thumbnails
rm -rf /home/user/.fontconfig
rm -rf /home/user/.config/libreoffice/4/.lock
rm -rf /home/user/.googleearth/instance-running-lock
rm -rf /home/user/.local/share/keyrings/*
echo "done."
echo 
echo -n "Cleaining up other stuff..."
sed -i 's/mac-address.*$//g' /etc/NetworkManager/system-connections/*
rm -rf /media/*
rm -f /etc/udev/rules.d/70-persistent-net.rules
echo "done."



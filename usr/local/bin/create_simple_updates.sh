#!/bin/bash

cd /home
/usr/local/bin/home_prep.sh

echo
echo -n "Creating user.tar.gz..."
tar -czf user.tar.gz user
echo "done."
echo
echo -n "Creating mods.tar.gz..."
mount LABEL=USER /mnt
cd /mnt
tar -czf /home/mods.tar.gz --exclude=lost+found --exclude=tmp --exclude=rw --exclude=ro --exclude=.wh.* --exclude=media --exclude=var/spool --exclude=var/cache --exclude=boot --exclude=etc/fstab --exclude=etc/mtab *
echo "done."
mv /home/*.gz /home/user/
chown user. /home/user/*.gz
cd /root
umount /mnt
echo
echo "Simple updates files created. You will find them in your home"
echo "folder when you reboot."
echo
echo "Please reboot your system now. [type reboot and press enter]"


#!/bin/bash

if mount | grep -q aufs; then
	echo "Sorry, you must be running with aufs=off for this to work"
else

/usr/local/bin/home_prep.sh

echo
echo -n "Moving user settings to default image..."
cd /
swapoff -a
umount /home
mount /dev/disk/by-label/HOME /mnt
rm -rf /home/user
cp -a /mnt/user /home/
umount /mnt
mount /home
echo "done."

#if mount | grep -q sda3; then
#echo
#echo -n "Deleting HOME partition..."
#umount /home
#sleep 3
#echo -e "d\n3\nw" | fdisk /dev/sda >/dev/null 2>&1
#echo "done."
#fi

#if fdisk -l /dev/sda | grep -q sda2; then
#echo
#echo -n "Deleting USER partition..."
#echo -e "d\n2\nw" | fdisk /dev/sda >/dev/null 2>&1
#echo "done."
#fi

fi


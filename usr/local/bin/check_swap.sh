#!/bin/bash

MEMTOTAL=`cat /proc/meminfo | grep MemTotal | awk '{print $2}'`
HOMEFREE=`df | grep home | awk '{print $2}'`
CURRENTSWAP=0

if [ -e /home/.swapfile ]; then
	CURRENTSWAP=`expr $(ls -l /home/.swapfile | awk '{print $5}') / 1024`
fi

if [[ ($HOMEFREE -gt 33000000) || ($MEMTOTAL -lt 4000000 && $HOMEFREE -gt $((MEMTOTAL*2))) ]];then 
	if [ $CURRENTSWAP -ne $MEMTOTAL ]; then
		if [ -e /home/.swapfile ]; then
			rm -f /home/.swapfile
		fi
		fallocate -l $(echo $MEMTOTAL)k /home/.swapfile 2>&1
		mkswap /home/.swapfile >/dev/null 2>&1
		echo /home/.swapfile swap swap defaults 0 0 >>/etc/fstab
		sysctl -w vm.swappiness=1 >/dev/null 2>&1
		echo vm.swappiness=1 >>/etc/sysctl.conf
		swapon /home/.swapfile
	fi
	if ! `grep -q swap /etc/fstab`; then
		swapon /home/.swapfile
	fi
fi

	

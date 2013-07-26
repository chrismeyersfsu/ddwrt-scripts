#!/bin/sh

ROOT="/tmp/mnt/disc0-part1/ddwrt_fs"
MOUNTS0="etc"
MOUNTS1="root"
MOUNTS2="opt"
MOUNT_POINTS0="/etc"
MOUNT_POINTS1="/tmp/root"
MOUNT_POINTS2="/opt"
i=0
y=3

tries=2
try_count=0
while [ $try_count -lt $tries ]
do
	if [ -d $ROOT ]; then 
		echo "Root exists, mounting USB storage backing"

		while [ $i -lt $y ]
		do
			CMD="grep -q \${MOUNT_POINTS${i}} /proc/mounts"
			eval $CMD
			ret=$?
			if [ $ret != 0 ]; then
				eval echo "Mounting $ROOT/\${MOUNTS${i}} to \${MOUNT_POINTS${i}}"
				eval mount -o bind $ROOT/\${MOUNTS${i}} \${MOUNT_POINTS${i}}
			fi
			i=`expr "$i" + 1`
		done
		exit
	else 
		echo "Root does not exist .. yet"
	fi
	sleep 5
done


#!/system/bin/sh

BBMGSK="/data/adb/magisk/busybox"
BBSYS="/system/xbin/busybox"
if [ -e $BBMGSK ] || [ -e $BBSYS ]; then
    if [ -e $BBMGSK ]; then
        echo "busybox found in :" $BBMGSK
        $BBMGSK mount -t ext4 -o remount,rw /system
    elif [ -e $BBSYS ]; then
        echo "busybox found in :" $BBSYS
        $BBSYS mount -t ext4 -o remount,rw /system
    fi;
fi;

ADDON="/system/addon.d"
if [ -d $ADDON ]; then
    echo "found in :" $ADDON
else
    echo "not found in :" $ADDON
    echo " "
    echo "Creating..."
    mkdir /system/addon.d
    echo "Set permission..."
    chmod 0755 /system/addon.d
    echo "Done :" $ADDON
fi;

#!/data/adb/magisk/busybox sh

HOSTS=/system/etc/hosts

ui_print "- Copy original hosts $HOSTS"
mkdir -p $MODPATH/system/etc
(( $? != 0 )) && abort ! Failed to create $MODPATH/system/etc
cp /system/etc/hosts $MODPATH/hosts.orig
(( $? != 0 )) && abort ! Failed to copy original hosts.

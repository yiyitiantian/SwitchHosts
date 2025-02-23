source $MODPATH/getenv.sh
HOSTS=/system/etc/hosts

ui_print "- Copy original hosts $HOSTS"
mkdir -p $MODPATH/system/etc || abort ! Failed to create $MODPATH/system/etc
cp /system/etc/hosts $MODPATH || abort ! Failed to copy original hosts.

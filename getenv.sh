CONFIG=$MODPATH/config
LOG=$MODPATH/log
HOSTS_ORIG=$MODPATH/hosts
HOSTS=$MODPATH/system/etc/hosts
log() { echo "$@" >> $LOG; }

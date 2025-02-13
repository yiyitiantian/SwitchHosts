#!/system/bin/sh
MODPATH=${0%/*}
CONFIG=$MODPATH/config
LOG=$MODPATH/log
HOSTS_ORIG=$MODPATH/hosts.orig
HOSTS=$MODPATH/system/etc/hosts

echo "------------$(date)------------" >> $LOG

log() {  echo "$@" >> $LOG; }
warn() { echo "error: $@" >> $LOG; }

while :; do
	# check network
	while ! ping -c 1 1.1.1.1; do
		warn "failed to connect network ( ping 1.1.1.1 )"
		sleep 30
	done
	log "connect to network"
	# load config
	while [ ! -f $CONFIG ]; do
		warn $CONFIG: No such file
		sleep 30
		continue
	done
	source $CONFIG
	
	# update hosts
	cp $HOSTS_ORIG $HOSTS
	for i in $URLs; do
		log "$i"
		/data/adb/magisk/busybox wget --no-check-certificate -qO "-" "$i" >> $HOSTS
	done

	sleep 3600
done

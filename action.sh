MODPATH=${0%/*}
source $MODPATH/getenv.sh

log "$(date)"
# check network
while ! ping -c 1 1.1.1.1; do
	log "failed to connect network ( ping 1.1.1.1 )"
	sleep 30
done
# load config
source $CONFIG
# update hosts
cp $HOSTS_ORIG $HOSTS
for i in $URLs; do
	wget --no-check-certificate -qO "-" "$i" >> $HOSTS
done

MODPATH=${0%/*}

while :; do
	sh $MODPATH/action.sh
	sleep 3600
done

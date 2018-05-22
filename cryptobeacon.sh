while :
do
	sleep 5
	HASH="$(date "+%m%d%Y%H%M salty salt" | openssl sha256 |tail -c 33 | tr -d '\n' | sed 's/.\{2\}/& /g')"
	echo $HASH
	sudo hcitool -i $BLUETOOTH_DEVICE cmd 0x08 0x0008 1e 02 01 1a 1a ff 4c 00 02 15 $HASH $MAJOR $MINOR $POWER 00 00 00 00 00 00 00 00 00 00 00 00 00
	sleep 5
	echo "Changing to default UUID"
	sudo hcitool -i $BLUETOOTH_DEVICE cmd 0x08 0x0008 1e 02 01 1a 1a ff 4c 00 02 15 $UUID $MAJOR $MINOR $POWER 00 00 00 00 00 00 00 00 00 00 00 00 00
done

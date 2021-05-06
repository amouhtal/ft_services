rc-service telegraf start
sleep 2
rc-service influxdb start
sleep 2

while true;
do
	pgrep telegraf
	pgrep_telegraf=$?
    if [ $pgrep_telegraf != 0 ]
    then
        echo "telegraf is not running !"
        exit 1
    fi
    pgrep influxd
	pgrep_influxd=$?
    if [ $pgrep_influxd != 0 ];
        then
    echo "influxd is not running !"
        exit 1
    fi
done
rc-service telegraf start
cd grafana && cd bin && ./grafana-server
sleep 3

while true;
do
	pgrep grafana-server
	pgrep_grafana=$?
    if [ $pgrep_grafana != 0 ];
    then
		echo "vsftpd is not running !"
		exit 1
    fi
	pgrep telegraf
	pgrep_telegraf=$?
    if [ $pgrep_telegraf != 0 ]
    then
		echo "telegraf is not running !"
		exit 1
    fi
    sleep 2
done
exit 0
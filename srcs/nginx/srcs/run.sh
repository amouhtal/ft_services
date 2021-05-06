rc-service telegraf start
sleep 2
rc-service nginx start
sleep 2

while true;
do
        pgrep nginx
	pgrep_nginx=$?
        if [ $pgrep_nginx != 0 ];
        then
		echo "nginx is not running !"
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
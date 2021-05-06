echo "Strating Telegraf ... "
rc-service telegraf start
sleep 2
echo "service vsftpd start ... "
rc-service vsftpd start
sleep 2
while true;
do
	pgrep vsftpd
	pgrep_vstftpd=$?
    if [ $pgrep_vstftpd != 0 ];
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
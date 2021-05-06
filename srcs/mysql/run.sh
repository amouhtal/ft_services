
rc-service telegraf start
echo "-------Install-------"
/etc/init.d/mariadb setup
rc-service mariadb start
echo "--------setup--------"
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root
echo "grant all privileges on *.* to 'admin'@'%';" | mysql -u root
echo "flush privileges;" | mysql -u root
mysql -u root wordpress < wordpress.sql
echo "-----------done----------"
rc-service mariadb stop


# 
sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start
sleep 2

while true;
do
	pgrep telegraf
	pgrep_telegraf=$?
    if [ $pgrep_telegraf != 0 ];
	then
		echo "telegraf is not running !"
		exit 1
	fi
	pgrep mysqld
	pgrep_mysql=$?
    if [ $pgrep_mysql != 0 ];
	then
		echo "mysql is not running !"
		exit 1
	fi
		sleep 2
done
exit 0
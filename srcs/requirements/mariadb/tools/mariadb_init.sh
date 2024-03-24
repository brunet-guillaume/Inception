#!/bin/sh

# testing if mysqld is already present
if [ -d "/run/mysqld" ]; then
	echo "mysqld already present."
	chown -R mysql:mysql /run/mysqld
else
	echo "Creating mysqld..."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

# testing if mysql is already present
if [ -d "/var/lib/mysql/mysql" ]; then
	echo "MySQL already present."
	chown -R mysql:mysql /var/lib/mysql
else
	echo "Creating initial db..."
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

	# generating random password if MYSQL_ROOT_PSW is empty
	if [ "$MYSQL_ROOT_PSW" = "" ]; then
		MYSQL_ROOT_PSW=`pwgen 16 1`
		echo "MySQL root psw: $MYSQL_ROOT_PSW"
	fi
	
	MYSQL_DB=${MYSQL_DB:-""}
	MYSQL_USER=${MYSQL_USER:-""}
	MYSQL_PSW=${MYSQL_PSW:-""}
	
	# creating sql commands for initialising the wordpress database
	tmp_file=`mktemp`
	if [ ! -f "$tmp_file" ]; then
		return 1
	fi

	cat << EOF > $tmp_file
USE mysql ;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PSW' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PSW' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PSW}') ;
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;
EOF
	
	if [ "$MYSQL_DB" != "" ]; then
		echo "Creating DB: $MYSQL_DB"
		echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB\` CHARACTER SET utf8 COLLATE utf8_general_ci ;" >> $tmp_file
		if [ "$MYSQL_USER" != "" ];  then
			echo "Creating user: $MYSQL_USER"
			echo "GRANT ALL ON \`$MYSQL_DB\`.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PSW' ;" >> $tmp_file
		fi
	fi

	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tmp_file
	rm -f $tmp_file
fi
# running mysql
exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@

#!/bin/bash

adduser -D www-data -G www-data

if [ -f /var/www/html/wp-config.php ]; then
	echo "Worpress already downloaded"
else
	mkdir /var/www/html
	chown -R www-data:www-data /var/www/html
	cd /var/www/html
	echo "Downloading wordpress..."
	curl https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -o wp.tar.gz
	tar xfz wp.tar.gz
	rm -rf wp.tar.gz
	mv wordpress/* .
	wp-cli config create --allow-root --dbname=$MYSQL_DB --dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PSW --dbhost=mariadb:3306
	wp-cli core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PSW --admin_email=$WP_ADMIN_EMAIL
	wp-cli user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PSW

	sed -i "s/require_once/define('WP_REDIS_HOST', 'redis');\nrequire_once/g" wp-config.php
	sed -i "s/require_once/define('WP_REDIS_PORT', '6379');\nrequire_once/g" wp-config.php
	wp-cli plugin install redis-cache --activate --allow-root
	wp-cli plugin update --all --allow-root
	wp-cli redis enable --allow-root
	
	chown -R www-data:www-data /var/www/html
fi

/usr/sbin/php-fpm81 -F

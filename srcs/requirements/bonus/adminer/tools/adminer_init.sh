#!/bin/sh

if [ ! -d /var/www/html ];then 
	mkdir -p /var/www/html
	cd /var/www/html
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
	mv adminer-4.8.1.php index.php
	adduser -u 82 -D -S -G www-data www-data
fi

php -S [::]:8080 -t /var/www/html

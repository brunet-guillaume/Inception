#!/bin/sh

# testing if html folder is already present
if [ ! -d /var/www/html ];then 
	mkdir -p /var/www/html
	cd /var/www/html
	# downloading adminer
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
	mv adminer-4.8.1.php index.php
	# adding www-data user
	adduser -u 82 -D -S -G www-data www-data
fi

# running php
php -S [::]:8080 -t /var/www/html

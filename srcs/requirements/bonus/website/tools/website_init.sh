#!/bin/sh

if [ ! -d /var/www/html ];then 
	mkdir /var/www/html
	echo "<html><body><h1>Salut</h1></body></html>" > /var/www/html/index.html
	rm /etc/nginx/http.d/default.conf
fi

nginx -g "daemon off;"

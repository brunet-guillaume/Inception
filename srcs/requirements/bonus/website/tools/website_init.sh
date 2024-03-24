#!/bin/sh

# testing if html folder is already present
if [ ! -d /var/www/html ]; then
	# creating html folder
	mkdir /var/www/html
	# copying website files in conveniant folder
	cp -a /scripts/website/. /var/www/html/
	rm -rf /scripts/website
	# removing nginx default website confdiguration file
	rm /etc/nginx/http.d/default.conf
fi

# running nginx
nginx -g "daemon off;"

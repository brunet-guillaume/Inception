#!/bin/bash

mkdir /var/www/html
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IdF/L=Paris/O=42/OU=gbrunet/CN=gbrunet.42.fr"
rm /etc/nginx/http.d/default.conf

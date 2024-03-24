#!/bin/bash

# creating html folder for worpress
mkdir /var/www/html
# creating ssl folder for nginx
mkdir /etc/nginx/ssl
# creatinf ssl certificates
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IdF/L=Paris/O=42/OU=gbrunet/CN=gbrunet.42.fr"
# removing nginx default website confdiguration file
rm /etc/nginx/http.d/default.conf

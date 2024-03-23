#!/bin/sh

if [ -d "/var/www/html/" ]; then
	echo "html folder already present."
else
	echo "Creating html folder..."
	mkdir -p /var/www/html
fi

adduser $FTP_USER --disabled-password
addgroup $FTP_USER www-data
echo "${FTP_USER}:${FTP_PSW}" | /usr/sbin/chpasswd
echo $FTP_USER | tee -a /etc/vsftpd.userlist

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

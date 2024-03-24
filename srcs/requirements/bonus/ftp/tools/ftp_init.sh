#!/bin/sh

# testing if html folder is already present
if [ -d "/var/www/html/" ]; then
	echo "html folder already present."
else
	echo "Creating html folder..."
	mkdir -p /var/www/html
fi

# adding user for ftp
adduser $FTP_USER --disabled-password
addgroup $FTP_USER www-data
echo "${FTP_USER}:${FTP_PSW}" | /usr/sbin/chpasswd
echo $FTP_USER | tee -a /etc/vsftpd.userlist

# running vsftpd
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

#!/bin/bash

/etc/init.d/mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS \`BDD\`;"
mysql -e "CREATE USER IF NOT EXISTS \`USER\`@'localhost' IDENTIFIED BY 'pswd';"
mysql -e "GRANT ALL PRIVILEGES ON \`BDD\`.* TO \`USER\`@'%' IDENTIFIED BY 'pswd';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -proot_pswd shutdown
exec mysqld_safe

# Inception (42 school)

Project in the fifth circle in 42 school.

## Mandatory part

The idea here, is to set up a small infrastructure composed of different services under specific rules.

Things we have to set up :
    - A docker container that contains NGINX with TSLv1.2 or TSLv1.3
    - A docker container that contains WordPress + php-fpm
    - A docker container that contains MariaDB
    - A volume that contains the WordPress databse.
    - A volume that contains the Wordpress website files.
    - A docker network that establishes the connection between the containers.

## Bonus part

For the bonus part, we need to add some services :
    - A redis cache for wordpress
    - A FTP server
    - A static website
    - A docker container for Adminer
    - An other service of our choice (cAdvisor)
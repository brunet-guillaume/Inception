# Inception (42 school)

Project in the fifth circle in 42 school.

## Mandatory part

The idea here, is to set up a small infrastructure composed of different services under specific rules.

Things we have to set up :
<table>
    <tr><td>A docker container that contains NGINX with TSLv1.2 or TSLv1.3</td></tr>
    <tr><td>A docker container that contains WordPress + php-fpm</td></tr>
    <tr><td>A docker container that contains MariaDB</td></tr>
    <tr><td>A volume that contains the WordPress databse</td></tr>
    <tr><td>A volume that contains the Wordpress website files</td></tr>
    <tr><td>A docker network that establishes the connection between the containers</td></tr>
</table>

## Bonus part

For the bonus part, we need to add some services :
<table>
    <tr><td>A redis cache for wordpress</td></tr>
    <tr><td>A FTP server</td></tr>
    <tr><td>A static website</td></tr>
    <tr><td>A docker container for Adminer</td></tr>
    <tr><td>An other service of our choice (cAdvisor)</td></tr>
</table>

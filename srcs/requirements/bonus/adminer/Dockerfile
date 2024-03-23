FROM alpine:3.18.6

RUN apk update && apk upgrade
RUN apk add curl less mariadb-client php81 php81-fpm php81-common \
	php81-session php81-iconv php81-json php81-gd php81-curl \
	php81-mysqli php81-imap php81-pdo php81-pdo_mysql php81-soap \
	php81-posix php81-gettext php81-ldap php81-ctype php81-dom \
	php81-simplexml

COPY tools/adminer_init.sh /scripts/
RUN chmod +x /scripts/adminer_init.sh

COPY conf/www.conf /etc/php81/php-fdm.d/www.conf

ENTRYPOINT ["/scripts/adminer_init.sh"]

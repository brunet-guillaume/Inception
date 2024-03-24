# penultimate alpine version (https://alpinelinux.org/cloud/)
FROM alpine:3.18.6

# update and upgrade
RUN apk update && apk upgrade
# installing utilities and php 8.1
RUN apk add php81 php81-common php81-session php81-iconv php81-gd \
	php81-curl php81-xml php81-mysqli php81-imap php81-cgi \
	php81-pdo php81-pdo_mysql php81-soap php81-posix php81-gettext \
	php81-ldap php81-ctype php81-dom php81-simplexml wget

# copying adminer_init.sh in the docker for entrypoint
COPY tools/adminer_init.sh /scripts/
RUN chmod +x /scripts/adminer_init.sh

# exposing 8080 for accessing adminer
EXPOSE 8080

# container entrypoint
ENTRYPOINT ["/scripts/adminer_init.sh"]

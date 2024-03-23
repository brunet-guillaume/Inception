FROM alpine:3.18.6

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client mariadb-server-utils
RUN apk add pwgen

COPY tools/mariadb_init.sh /scripts/
RUN chmod +x /scripts/mariadb_init.sh

EXPOSE 3306

ENTRYPOINT ["/scripts/mariadb_init.sh"]

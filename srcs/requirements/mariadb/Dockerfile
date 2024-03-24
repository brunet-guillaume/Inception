# penultimate alpine version (https://alpinelinux.org/cloud/)
FROM alpine:3.18.6

# update and upgrade
RUN apk update && apk upgrade
# installing mariadb and pwgen
RUN apk add mariadb mariadb-client mariadb-server-utils
RUN apk add pwgen

# copying mariadb_init.sh in the docker for entrypoint
COPY tools/mariadb_init.sh /scripts/
RUN chmod +x /scripts/mariadb_init.sh

# container entrypoint
ENTRYPOINT ["/scripts/mariadb_init.sh"]

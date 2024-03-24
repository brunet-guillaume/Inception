# penultimate alpine version (https://alpinelinux.org/cloud/)
FROM alpine:3.18.6

# update and upgrade
RUN apk update && apk upgrade
# installing vsftpd
RUN apk add vsftpd

# copying ftp_init.sh in the docker for entrypoint
COPY tools/ftp_init.sh /scripts/
RUN chmod +x /scripts/ftp_init.sh

# copying vsftpd.conf in conveniant folder for vsftpd
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

# container entrypoint
ENTRYPOINT ["/scripts/ftp_init.sh"]

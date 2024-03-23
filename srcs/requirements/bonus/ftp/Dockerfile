FROM alpine:3.18.6

RUN apk update && apk upgrade
RUN apk add vsftpd

COPY tools/ftp_init.sh /scripts/
RUN chmod +x /scripts/ftp_init.sh

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT ["/scripts/ftp_init.sh"]

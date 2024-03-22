FROM debian:bullseye

RUN apt-get update && apt-get upgrade
RUN apt-get install nginx -y
RUN apt-get install openssl -y

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IdF/L=Paris/O=42/OU=gbrunet/CN=gbrunet.42.fr"

COPY ./conf/default /etc/nginx/sites-available/default

EXPOSE 80/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

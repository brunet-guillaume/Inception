# penultimate alpine version (https://alpinelinux.org/cloud/)
FROM alpine:3.18.6

# update and upgrade
RUN apk update && apk upgrade
# installing nginx and openssl
RUN apk add nginx
RUN apk add openssl

# copying nginx_init.sh in the docker before running it to
# create ssl certificate
COPY tools/nginx_init.sh /scripts/
RUN chmod +x /scripts/nginx_init.sh
RUN sh /scripts/nginx_init.sh

# copying wordpress.conf in conveniant folder for nginx
COPY conf/wordpress.conf /etc/nginx/http.d/wordpress.conf
# Bonus : copying adminer.conf, website.conf and cadvisor.conf
# in conveniant fiolder for nginx
COPY conf/adminer.conf /etc/nginx/http.d/adminer.conf
COPY conf/website.conf /etc/nginx/http.d/website.conf
COPY conf/cadvisor.conf /etc/nginx/http.d/cadvisor.conf

# exposing TCP port 443
EXPOSE 443/tcp

# starting the container with nginx
CMD ["nginx", "-g", "daemon off;"]

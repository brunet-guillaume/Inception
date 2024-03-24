FROM alpine:3.18.6

RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl

# Copying nginx_init.sh in the docker before running it to
# create ssl certificate
COPY tools/nginx_init.sh /scripts/
RUN chmod +x /scripts/nginx_init.sh
RUN sh /scripts/nginx_init.sh

# Copying wordpress.conf in conveniant folder for nginx
COPY conf/wordpress.conf /etc/nginx/http.d/wordpress.conf
COPY conf/adminer.conf /etc/nginx/http.d/adminer.conf
COPY conf/website.conf /etc/nginx/http.d/website.conf
COPY conf/cadvisor.conf /etc/nginx/http.d/cadvisor.conf

EXPOSE 443/tcp

CMD ["nginx", "-g", "daemon off;"]

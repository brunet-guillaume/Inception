FROM alpine:3.18.6

RUN apk update && apk upgrade
RUN apk add nginx

COPY tools/website_init.sh /scripts/
RUN chmod +x /scripts/website_init.sh

COPY conf/website.conf /etc/nginx/http.d/website.conf

EXPOSE 80

ENTRYPOINT ["/scripts/website_init.sh"]

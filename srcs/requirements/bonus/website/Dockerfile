# penultimate alpine version (https://alpinelinux.org/cloud/)
FROM alpine:3.18.6

# update and upgrade
RUN apk update && apk upgrade
# installing nginx
RUN apk add nginx

# copying website_init.sh in the docker for entrypoint
COPY tools/website_init.sh /scripts/
RUN chmod +x /scripts/website_init.sh

# copying website.conf in conveniant folder for nginx
COPY conf/website.conf /etc/nginx/http.d/website.conf
# adding website files in container
ADD conf/website /scripts/website

#EXPOSE 80

# container entrypoint
ENTRYPOINT ["/scripts/website_init.sh"]

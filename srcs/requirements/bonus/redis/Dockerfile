FROM alpine:3.18.6

RUN apk update && apk upgrade

RUN adduser -D -H redis
RUN addgroup redis www-data
RUN apk add redis

COPY tools/redis_init.sh /scripts/
RUN chmod +x /scripts/redis_init.sh

COPY conf/redis.conf /etc/redis.conf
COPY conf/sysctl.conf /etc/sysctl.conf

EXPOSE 6379

ENTRYPOINT ["/scripts/redis_init.sh"]

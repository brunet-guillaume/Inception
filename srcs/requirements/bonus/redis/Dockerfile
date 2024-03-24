# penultimate alpine version (https://alpinelinux.org/cloud/)
FROM alpine:3.18.6

# update and upgrade
RUN apk update && apk upgrade
# adding user redis and adding redis user to group www-data
RUN adduser -D -H redis
RUN addgroup redis www-data
# installing redis
RUN apk add redis

# copying redis_init.sh in the docker for entrypoint
COPY tools/redis_init.sh /scripts/
RUN chmod +x /scripts/redis_init.sh

# copying redis.conf in conveniant folder for redis
COPY conf/redis.conf /etc/redis.conf
# copying sysctl.conf in conveniant folder for sysctl
COPY conf/sysctl.conf /etc/sysctl.conf

# container entrypoint
ENTRYPOINT ["/scripts/redis_init.sh"]

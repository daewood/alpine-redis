FROM alpine:edge
MAINTAINER daewood
RUN apk add --no-cache 'su-exec>=0.2'
RUN apk --update add  redis  && \
    rm -rf /var/cache/apk/*

RUN mkdir /data && chown redis:redis /data
VOLUME ["/data"]
WORKDIR /data

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

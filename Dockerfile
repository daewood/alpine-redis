FROM alpine:edge

RUN apk --update add  redis && \
    rm -rf /var/cache/apk/*
#pass&remote
RUN    sed -i "s/# requirepass foobared/requirepass youpasswd/g" /etc/redis.conf \
    && sed -i "s/^bind 127\.0\.0\.1.*/bind 0\.0\.0\.0/g" /etc/redis.conf \
    && sed -i "s/^daemonize yes/daemonize no/g" /etc/redis.conf 
EXPOSE 6379

RUN mkdir /data && chown redis:redis /data
VOLUME ["/data"]
WORKDIR /data

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
COPY redis.conf /etc/redis.conf
CMD ["redis-server", "/etc/redis.conf"]

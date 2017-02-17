FROM alpine:edge
MAINTAINER daewood <daewood@qq.com>

RUN apk --update add redis su-exec && \
    rm -rf /var/cache/apk/* && \
	mkdir /data && chown redis:redis /data
	
VOLUME ["/data"]
WORKDIR /data
EXPOSE 6379
COPY redis.conf /etc/redis.conf
COPY run.sh /root
ENTRYPOINT [ "/root/run.sh" ]
CMD [ "redis-server","/etc/redis.conf" ]

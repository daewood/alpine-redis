# alpine-redis
Redis Alpine Dockerfile

# Usage
- redis.conf file copy into "docker_volume_name" folder.
- Download redis.conf file: http://download.redis.io/redis-stable/redis.conf

Default Conf Run
```
$ docker run -d --name redis -v <docker_volume_name>:/data daewood/alpine-redis
```

Advanced Conf Run
```
$ docker run -d --name redis -v <docker_volume_name>:/data -v <redis_conf_file>:/etc/redis.conf daewood/alpine-redis
```


# Many many Thanks
https://github.com/docker-library/redis
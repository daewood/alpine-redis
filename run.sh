#!/bin/sh

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
	set -- redis-server "$@"
fi

# Docker entrypoint (pid 1), run as root
[ "$1" = "redis-server" ] || exec "$@" || exit $?

# Make sure that database is owned by user mongodb
[ "$(stat -c %U /data)" = redis ] || chown -R redis /data

# Drop root privilege (no way back), exec provided command as user redis
cmd=exec; for i; do cmd="$cmd '$i'"; done
exec su -s /bin/sh -c "$cmd" redis

#!/bin/bash
set -e

mkdir -p /run/redis
chmod -R 0755 /run/redis
chown -R redis:redis /run/redis

mkdir -p /var/lib/redis
chmod -R 0755 /var/lib/redis
chown -R redis:redis /var/lib/redis

mkdir -p /var/log/redis
chmod -R 0755 /var/log/redis
chown -R redis:redis /var/log/redis


echo "Starting redis-server..."
exec start-stop-daemon --start --chuid redis:redis --exec $(which redis-server) -- \
/etc/redis/redis.conf 

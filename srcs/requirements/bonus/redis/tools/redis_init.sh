#!/bin/sh

if [ ! -d /data ]; then
	echo "Creating /data directory"
	mkdir /data
fi

chown -R redis:redis /data

redis-server --protected-mode no

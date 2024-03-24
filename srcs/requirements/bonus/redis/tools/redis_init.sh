#!/bin/sh

# testing if data folder is already present
if [ ! -d /data ]; then
	echo "Creating /data directory"
	mkdir /data
fi

chown -R redis:redis /data

# running redis-server
redis-server --protected-mode no

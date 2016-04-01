#!/bin/sh

. ../config.sh
. ./module.sh

set -e

# pull template
docker pull $image

docker run --name=node-red -p 1880:1880 \
	-v ${DOCKER_BASE}/var/lib/node-red/:/var/lib/node-red \
	-h node-red \
	--net=$DOCKER_NET \
	--net-alias=$name \
	-u nobody:nogroup \
	-d \
	$image \
	/usr/local/bin/node-red \
		--userDir /var/lib/node-red \
		--settings /var/lib/node-red/settings.js


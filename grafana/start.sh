#!/bin/sh 

. ../config.sh
. ./module.sh

set -e

# pull template
docker pull $image

# start container
docker run --name=$name -d \
        -p 3000:3000 \
        -v ${DOCKER_BASE}/var/lib/grafana:/var/lib/grafana \
        -h $name \
        --net=$DOCKER_NET \
        --net-alias=$name \
        $image

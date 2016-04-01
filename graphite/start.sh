#!/bin/sh 

. ../config.sh
. ./module.sh

set -e

# pull template
docker pull $image

# remove old if exists.
docker run --name=$name -d \
        -p 8088:80 \
        -p 2003:2003 \
        -v ${DOCKER_BASE}/opt/graphite/conf/.htpasswd:/etc/nginx/.htpasswd \
        -v ${DOCKER_BASE}/opt/graphite/storage/whisper:/opt/graphite/storage/whisper \
        -v ${DOCKER_BASE}/opt/graphite/conf/storage-schemas.conf:/opt/graphite/conf/storage-schemas.conf \
        -v ${DOCKER_BASE}/var/log/graphite:/var/log \
        -h $name \
        --net=$DOCKER_NET \
        --net-alias=$name \
        $image

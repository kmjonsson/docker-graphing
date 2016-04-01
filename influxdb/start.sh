#!/bin/sh 

. ../config.sh
. ./module.sh

set -e

# pull template
docker pull debian:jessie

# Build
docker build -t $image:latest .

docker run --name=$name -d \
        -p 8083:8083 \
        -p 8086:8086 \
        -h $name \
        --net=$DOCKER_NET \
        --net-alias=$name \
        -u influxdb:influxdb \
        -v ${DOCKER_BASE}/var/lib/influxdb:/var/lib/influxdb \
        $image -config /etc/influxdb/influxdb.conf

#!/bin/sh 

. ../config.sh
. ./module.sh

set -e

# pull template
docker pull ubuntu:15.10

# build
docker build -t fot/$name:latest .

# start
docker run --name=$name -d \
        -p 1883:1883 \
        -h $name \
        --net=$DOCKER_NET \
        --net-alias=$name \
        -v ${DOCKER_BASE}/var/lib/mosquitto:/var/lib/mosquitto \
        -v ${DOCKER_BASE}/var/log/mosquitto:/var/log/mosquitto \
        -v ${DOCKER_BASE}/etc/mosquitto/conf.d:/etc/mosquitto/conf.d \
        -v ${DOCKER_BASE}/etc/mosquitto/passwd:/etc/mosquitto/passwd \
        $image

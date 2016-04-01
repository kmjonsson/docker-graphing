#!/bin/sh 

. ../config.sh
. ./module.sh

set -e

# pull template
$DOCKER_FORCE || docker pull ubuntu:15.10 | tee /dev/stderr | grep -q 'Status: Downloaded newer image' || exit

# build
docker build -t fot/$name:latest .

# restart
docker restart $name

#!/bin/sh 

. ../config.sh
. ./module.sh

set -e

# pull template
$DOCKER_FORCE || docker pull debian:jessie | tee /dev/stderr | grep -q 'Status: Downloaded newer image' || exit

docker build -t $image:latest .

docker restart $name

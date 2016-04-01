#!/bin/sh 

. ../config.sh
. ./module.sh

set -e

# pull template
$DOCKER_FORCE || docker pull $image | tee /dev/stderr | grep -q 'Status: Downloaded newer image' && docker restart $name

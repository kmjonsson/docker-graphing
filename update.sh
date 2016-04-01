#!/bin/sh

. ./config.sh

for c in $DOCKERS; do
	cd $c
	sh update.sh
	cd ..
done

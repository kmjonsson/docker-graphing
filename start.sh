#!/bin/sh

. config.sh

for c in $DOCKERS; do
	cd $c
	sh ./start.sh
	cd ..
done

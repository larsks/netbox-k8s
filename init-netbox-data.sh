#!/bin/sh

git clone -b ${NETBOX_GIT_REF:-develop} \
	https://github.com/netbox-community/netbox-docker.git \
	/tmp/netbox-docker

cd /tmp/netbox-docker
for dir in startup_scripts initializers configuration reports scripts; do
	tar -cf- $dir | tar -C /target -xf-
done

mkdir -p /target/nginx
cp docker/nginx.conf /target/nginx

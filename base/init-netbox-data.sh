#!/bin/sh

: ${NETBOX_GIT_URL:=https://github.com/netbox-community/netbox-docker.git}
: ${NETBOX_GIT_REF:=develop}

git clone -b ${NETBOX_GIT_REF} ${NETBOX_GIT_URL} /tmp/netbox-config

cd /tmp/netbox-config
for dir in startup_scripts initializers configuration reports scripts; do
	tar -cf- $dir | tar -C /target -xf-
done

mkdir -p /target/nginx
cp docker/nginx.conf /target/nginx

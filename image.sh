#!/usr/bin/env bash
glance image-list
OLD_ID=`glance details | grep "Name: test-image" -B3 | grep Id | cut -d' ' -f2`
glance image-delete $OLD_ID
IMAGE="cirros-0.3.0-x86_64-disk.img"
wget -nc http://launchpad.net/cirros/trunk/0.3.0/+download/$IMAGE
glance image-create --name "test-image" --public --container-format bare --disk-format qcow2 < "$IMAGE"
glance image-list

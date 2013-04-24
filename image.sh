#!/usr/bin/env bash
glance image-list
OLD_ID=`glance details | grep "Name: test-image" -B3 | grep Id | cut -d' ' -f2`
if [ "$OLD_ID" != "" ]; then
    glance image-delete $OLD_ID
fi
IMAGE="http://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img"
wget -nc $IMAGE
glance image-create --name "test-image" --container-format bare --disk-format qcow2 < `basename $IMAGE`
glance image-list

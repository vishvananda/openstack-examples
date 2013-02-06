#!/usr/bin/env bash
nova secgroup-list
nova secgroup-list-rules default
nova secgroup-delete-rule default tcp 22 22 0.0.0.0/0
nova secgroup-delete-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-list-rules default

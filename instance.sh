#!/usr/bin/env bash
nova list
nova delete test-instance
nova boot --flavor 1 --image test-image --key-name test test-instance
nova list

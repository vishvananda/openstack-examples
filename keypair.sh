#!/usr/bin/env bash
nova keypair-list
nova keypair-delete test
nova keypair-add test > test.pem
nova keypair-list

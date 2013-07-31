#!/usr/bin/env bash
source helper.jq
KEYPAIRS=`curl -s "$ENDPOINT/os-keypairs" -X GET -H "Accept: application/json" -H "X-Auth-Token: $TOKEN"`
for (( i = 0; i <= `echo $KEYPAIRS | jq '.keypairs | length - 1'`; i++ )); do
    echo $KEYPAIRS | jq -r .keypairs[$i].keypair.name
    echo $KEYPAIRS | jq -r .keypairs[$i].keypair.fingerprint
done

curl -s "$ENDPOINT/os-keypairs/test" -X DELETE -H "X-Auth-Token: $TOKEN"
JSON=`jq -n '.keypair.name = "test"'`
KEYPAIR=`curl -s "$ENDPOINT/os-keypairs" -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: $TOKEN" -d "$JSON"`
echo -e `echo $KEYPAIR | jq -r .keypair.private_key` > test.pem

KEYPAIRS=`curl -s "$ENDPOINT/os-keypairs" -X GET -H "Accept: application/json" -H "X-Auth-Token: $TOKEN"`
for (( i = 0; i <= `echo $KEYPAIRS | jq '.keypairs | length - 1'`; i++ )); do
    echo $KEYPAIRS | jq -r .keypairs[$i].keypair.name
    echo $KEYPAIRS | jq -r .keypairs[$i].keypair.fingerprint
done

#!/usr/bin/env bash
source helper.jq
KEYPAIRS=`curl -s "$ENDPOINT/os-keypairs" -X GET -H "Accept: application/json" -H "X-Auth-Token: $TOKEN"`
for (( i = 0; i <= `echo $KEYPAIRS | jq '.keypairs | length - 1'`; i++ )); do
    echo $KEYPAIRS | jq .keypairs[$i].keypair.name | tr -d '"'
    echo $KEYPAIRS | jq .keypairs[$i].keypair.fingerprint | tr -d '"'
done

curl -s "$ENDPOINT/os-keypairs/test" -X DELETE -H "X-Auth-Token: $TOKEN"
JSON=`jq -n '.keypair.name = "test"'`
KEYPAIR=`curl -s "$ENDPOINT/os-keypairs" -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: $TOKEN" -d "$JSON"`
echo -e `echo $KEYPAIR | jq .keypair.private_key | tr -d '"'` > test.pem

KEYPAIRS=`curl -s "$ENDPOINT/os-keypairs" -X GET -H "Accept: application/json" -H "X-Auth-Token: $TOKEN"`
for (( i = 0; i <= `echo $KEYPAIRS | jq '.keypairs | length - 1'`; i++ )); do
    echo $KEYPAIRS | jq .keypairs[$i].keypair.name | tr -d '"'
    echo $KEYPAIRS | jq .keypairs[$i].keypair.fingerprint | tr -d '"'
done

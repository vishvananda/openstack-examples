#!/usr/bin/env bash
JSON=`jq -n ".auth.passwordCredentials.password = \"$OS_PASSWORD\" | .auth.passwordCredentials.username = \"$OS_USERNAME\" | .auth.tenantName = \"$OS_TENANT_NAME\""`
CREDS=`curl -s "$OS_AUTH_URL/tokens" -X POST -H "Content-Type: application/json" -d "$JSON"`

TOKEN=`echo $CREDS | jq .access.token.id | tr -d '"'`
TENANT_ID=`echo $CREDS | jq .access.token.tenant.id | tr -d '"'`
ENDPOINT=`echo $CREDS | jq '.access.serviceCatalog[] | select(.type == "compute").endpoints[0].publicURL' | tr -d '"'`

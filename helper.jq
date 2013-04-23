#!/usr/bin/env bash
JSON=`jq -n ".auth.passwordCredentials.password = \"$OS_PASSWORD\" | .auth.passwordCredentials.username = \"$OS_USERNAME\" | .auth.tenantName = \"$OS_TENANT_NAME\""`
CREDS=`curl -s "$OS_AUTH_URL/tokens" -X POST -H "Content-Type: application/json" -d "$JSON"`

TOKEN=`echo $CREDS | jq -r .access.token.id`
TENANT_ID=`echo $CREDS | jq -r .access.token.tenant.id`
ENDPOINT=`echo $CREDS | jq -r '.access.serviceCatalog[] | select(.type == "compute").endpoints[0].publicURL'`

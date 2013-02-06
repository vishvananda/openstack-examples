#!/usr/bin/env python
import os
from novaclient.v1_1 import client

def get_client():
    username = os.getenv('OS_USERNAME')
    tenant_name = os.getenv('OS_TENANT_NAME')
    password = os.getenv('OS_PASSWORD')
    auth_url = os.getenv('OS_AUTH_URL')

    return client.Client(username=username,
                         api_key=password,
                         project_id=tenant_name,
                         auth_url=auth_url)

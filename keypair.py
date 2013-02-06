#!/usr/bin/env python
import helper

client = helper.get_client()
keypairs = client.keypairs.list()
for keypair in keypairs:
    print keypair.name
    print keypair.fingerprint
client.keypairs.delete('test')
keypair = client.keypairs.create('test')
with open('test.pem', 'w') as f:
    f.write(keypair.private_key)
keypairs = client.keypairs.list()
for keypair in keypairs:
    print keypair.name
    print keypair.fingerprint

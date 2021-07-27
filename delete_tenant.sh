#!/bin/bash

printf "\n ### Deleting Tenant ###\n\n"
curl -s -b cookie.txt -X POST -k https://$APIC/api/mo/uni.json -d '{"fvTenant":{"attributes":{"name":"Jenkins123", "status":"deleted"}}}'

#!/bin/bash

printf "\n ### adding tenant ###\n"
curl -s -b cookie.txt -X POST -k https://$APIC/api/mo/uni.json -d '{"fvTenant":{"attributes":{"name":"Jenkins123"}}}'

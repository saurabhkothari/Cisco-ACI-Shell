#!/bin/bash

printf "\n ### Printing list of all Tenants ###\n\n"
curl -s -b cookie.txt -X GET -k https://$APIC/api/node/class/fvTenant.json | jq --raw-output '.imdata[] .fvTenant .attributes .name'

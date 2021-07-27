#!/bin/bash

APIC="10.76.101.138"

printf "\n### logging in ###\n"

OUT=$(curl -s -X POST -k https://$APIC/api/aaaLogin.json -d '{ "aaaUser" : { "attributes" : { "name" : "admin" , "pwd" : "cisco'\!'1234" } } }' -c cookie.txt EOF)
ERRCODE=$(echo $OUT | jq --raw-output '.imdata[0] .error .attributes .code')
ERRTEXT=$(echo $OUT | jq --raw-output '.imdata[0] .error .attributes .text')

# Check if an error code exists
if [ "${ERRCODE//[0-9]}" = "" ]
then
	printf "$ERRCODE : $ERRTEXT\n"
	exit 0
else
	printf "Login OK"
fi

printf "\n ### Printing list of all Tenants ###\n\n"
curl -s -b cookie.txt -X GET -k https://$APIC/api/node/class/fvTenant.json | jq --raw-output '.imdata[] .fvTenant .attributes .name'

printf "\n ### adding tenant ###\n"
curl -s -b cookie.txt -X POST -k https://$APIC/api/mo/uni.json -d '{"fvTenant":{"attributes":{"name":"TEST1234"}}}'

printf "\n ### Printing list of all Tenants ###\n\n"
curl -s -b cookie.txt -X GET -k https://$APIC/api/node/class/fvTenant.json | jq --raw-output '.imdata[] .fvTenant .attributes .name'

printf "\n ### Deleting Tenant ###\n\n"
curl -s -b cookie.txt -X POST -k https://$APIC/api/mo/uni.json -d '{"fvTenant":{"attributes":{"name":"TEST1234", "status":"deleted"}}}'

printf "\n ### Printing list of all Tenants ###\n\n"
curl -s -b cookie.txt -X GET -k https://$APIC/api/node/class/fvTenant.json | jq --raw-output '.imdata[] .fvTenant .attributes .name'

printf "\n### removing cookie.txt ### \n\n"
rm cookie.txt

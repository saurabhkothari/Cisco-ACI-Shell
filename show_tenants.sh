#!/bin/bash

APIC="10.76.101.138"

OUT=$(curl -s -X POST -k https://$APIC/api/aaaLogin.json -d '{ "aaaUser" : { "attributes" : { "name" : "admin" , "pwd" : "cisco'\!'1234" } } }' -c cookie.txt EOF)
ERRCODE=$(echo $OUT | jq --raw-output '.imdata[0] .error .attributes .code')
ERRTEXT=$(echo $OUT | jq --raw-output '.imdata[0] .error .attributes .text')

# Check if an error code exists
if [ "${ERRCODE//[0-9]}" = "" ]
then
	printf "$ERRCODE : $ERRTEXT\n"
	exit 0
else
	printf " "
fi

printf "\n\n ### Printing list of all Tenants ###\n\n"
curl -s -b cookie.txt -X GET -k https://$APIC/api/node/class/fvTenant.json | jq --raw-output '.imdata[] .fvTenant .attributes .name'

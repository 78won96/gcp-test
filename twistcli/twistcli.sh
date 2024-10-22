#!/bin/sh
#curl -k -u $TL_USER:$TL_PASS --output /twistcli $TL_CONSOLE_URL/api/v1/util/twistcli
#chmod a+x /twistcli
#/twistcli images scan --details -address $TL_CONSOLE_URL -u $TL_USER -p $TL_PASS $1


#!/bin/sh
curl -k -u $$prismauser:$$prismapassword= --output /twistcli $address
chmod a+x /twistcli
/twistcli images scan --details -address $address -u $$prismauser -p $$prismapassword
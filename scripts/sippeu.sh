#!/bin/bash
#Script for check 5060 port on zabbix server
sipp $1 -sn uac -m 1 -timeout 4 -timeout_error > /dev/null 2>&1

a=$?

if [ $a -eq "255" ]
then
echo "KO"
else
	if [ $a -eq "1" ]
	then
		echo "OK"
	fi
fi

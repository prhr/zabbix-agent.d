#!/bin/bash
#Script for check sipp 5060 port on zabbix server
sipp $1 -i 192.168.1.4 -timeout 4 -timeout_error -sf /etc/zabbix-agent.d/sipp_xml/OPTIONS_recv_200.xml -m 1 -s 9999 > /dev/null 2>&1

if [ $? -eq 0 ]
then
echo "OK"
else
if [ $? -eq 1 ]
then
echo "KO"
else
if [ $? -eq 255 ]
then
echo "KO"
fi
fi
fi

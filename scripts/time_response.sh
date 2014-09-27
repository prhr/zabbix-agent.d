#!/bin/bash

curl --insecure --connect-timeout 2 --max-time 3 -s -w "%{time_total}" -o /dev/null $1 | sed s/,/./g

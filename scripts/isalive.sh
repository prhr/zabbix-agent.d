#!/bin/bash
curl --insecure --connect-timeout 2 --max-time 3 -s $1 | grep OK | wc -l

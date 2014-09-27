#!/bin/bash
#
# Author: Adrian
# Date: 2013-08-29
# This script checks the dns for the domains given

# The script will be executes with the following structure: $IP $DOMAIN1 $DOMAIN2
# Example: dns_check.sh 2.2.2.2 test.com test2.com test3.com

# Number of input arguments:
let num_args=$#

# Array with the arguments
args=($@)

# Constant to substract
let a=1

# Number of domains given
num_of_domains=${args[1]}

# Number of arguments for the array
let array_num_args=$num_of_domains-$a+2


# Constant that keeps the sucessfully domains checked
let total=0

# Check the dns
for i in $(eval echo {2..$array_num_args})
do

        x=`exec /usr/bin/dig  @8.8.8.8 ${args[$i]} |grep $1 |wc -l`
        if [ $x -eq 1 ]; then
                let total=$total+1
        fi


done

# If everything is ok, returns 1
if [ $total -eq $num_of_domains ]; then
        echo 1
else
        echo 0
fi

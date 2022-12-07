#!/bin/sh

#This script will be used to check of new users already exist in system

newusers=`cat /home/my_scripts/loops/newusers.txt | sort -f`
oldusers=`getent passwd {1000..60000} | awk -F: '{print $1}' | sort -f`

`comm -12 $newusers $oldusers1`

#difference=`(( diff -q $oldusers $newusers ))`
#echo "$difference"



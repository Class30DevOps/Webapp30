#!/bin/bash

cat << apache 
Welcome to apache self service, where you can manage the apache service. 

What do you want to do?

Your options are status, enable, start, stop, restart, disable

apache

read option

case $option in
status)
		echo "`sudo systemctl status httpd`";;
enable)
		echo "`sudo systemctl enable httpd`";;
start)
		echo "`sudo systemctl start httpd`";;
stop)
		echo "`sudo systemctl stop httpd`";;
restart)
		echo "`sudo systemctl restart httpd`";;
disable)
		echo "`sudo systemctl disable httpd`";;
*)
		echo "Option not found. Choises are case sensitive. Please check options and try again";;
esac

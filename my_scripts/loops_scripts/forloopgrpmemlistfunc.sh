#! /bin/bash
# by C'est La Vie

#This script will list the group members of all the groups in the server

#check all groups with gid between 1 and 60k

groupcheck() {
grps=`getent group {1000..60000} | cut -d: -f1`
grpcnt="${grps[@]}"
host=`hostname`


echo -e "\nLIST OF AVAILABLE USER GROUPS IN $host SERVER:\n$grps\n"

#iterate through all groups in the /etc/group file
for i in $grps
do

	groupmems=`sudo lid -g $i`

	echo -e "\nThe group member(s) of $i group are:...\n$groupmems\n\n"

done

}


groupcheck2() {

echo -e "THIS IS A TEST OF FUNCTIONS AGAIN, LET'S SEE"
}


#case $1 in 
#	groupcheck) "$@"; exit;;
#	groupcheck2) "$@"; exit;;
#esac

#groupcheck
#groupcheck2

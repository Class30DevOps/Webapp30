
#!/bin/bash


# bash script created by Emmanuel Jr.
# purpose is to create users and groups within certain parameters and create files to check successful creation of users and groups. 

##1. Create user "Bob"
sudo adduser bob

##2. Make sure "/data" directory is owned by user "bob" and group "devs" and "user/group" owner has "full" permissions but "other" should not have any
sudo mkdir /home/Data
sudo groupadd devs
sudo chmod 770 /home/Data
sudo chown bob:devs /home/Data

##3.  Create a group called "admins"
sudo groupadd admins

##5. Create a user called "david" , change his login shell to "/bin/zsh" and set "D3vUd3raaw" password for this user. Make user "david" a member of "admins" group.
sudo adduser -m david -s /bin/zsh -e 2022-11-19 -p sazIYAwBqBQPs -g admins

##6.  Create a user called "natasha" , change her login shell to "/bin/zsh" and set "DwfawUd113" password for this user. Make user "natasha" a member of "admins" group.
sudo adduser natasha -s /bin/zsh -e 2022-11-19 -p sabIntysT5HQM -g admins

##7.  Create a user called "lisa", change her login shell to "/bin/sh" and set "D3vUd3r123" password for this user. Make user "lisa" a member of "devs" group.
sudo adduser lisa -s /bin/zsh -p sa4g.2sibKQyA -e 2022-11-19  -g devs

##8.  Create a user called "ray" , change his login shell to "/bin/sh" and set "D3vU3r321" password for this user. Make user "ray" a member of "devs" group.
sudo adduser ray -s /bin/sh -p saU5PkmshAia. -e 2022-11-19  -g devs
sudo adduser rayz -s /bin/sh -p saU5PkmshAia. -e 2022-11-19  -g devs

##Check to make sure all users have been added in a simple way without all the noise and write the oupt to a file. Overright the file each time this query is ran: 
getent passwd {1000..60000} |cut -d: -f1 >/home/my_scripts/user_add_checks.txt


##Check to make check the list of groups that are in the system. Overright the file each time this query is ran:
getent group {1000..60000} |cut -d: -f1 >/home/my_scripts/group_add_checks.txt



##check to Make sure all the users have been added to their respective groups.
sudo lid -g devs > /home/my_scripts/devgrp_mems.txt  
sudo lid -g admins > /home/my_scripts/adminsgrp_mems.txt

##9. Make sure all users under "devs" group can only run the "yum" command with "sudo" and without entering any password.
#sudo visudo 
# This task will be completed manually in the /etc/sudoers file

##10. Configure a "resource limit" for the "devs" group so that this group (members of the group) can not run more than "30  processes" in their session. 
#This should be both a "hard limit" and a "soft limit", written in a single line. 
#ulimit -a to see all the current limits for the login user
#sudo nano /etc/security/limit.conf   to update the soft and hard limits for group dev.

##11. Give some additional permissions to "admins" group on "/data" directory so that any user who is the member the "admins" group has "full permissions" on this directory.
sudo setfacl -m g:admins:rwx /home/Data
#check to make sure task was successful: getfacl /home/Data

##12. Make sure all users under "admins" group can run all commands with "sudo" and without entering any password.
# done manually from /etc/sudoers file.

##13.  Edit the disk quota for the group called "devs". Limit the amount of storage space it can use (not inodes). Set a "soft" limit of "100MB" and a "hard" limit of "500MB" on "/data" partition.
#sudo yum install list quota
#sudo parted -l - list partitions
#List existing partitions: sudo fdisk -l
#See list of partitions, file type and where they're mounted : df -Th  or lsblk


#!/bin/bash
#This script will be used by anyone to deploy and application to a server.
echo "Deployment in progress"
date
#sleep 5
echo "Please enter a directory name for the deployment"
read Dir
sudo mkdir $Dir
echo "Please enter the file/app name you are deploying"
read name
sudo touch $Dir/$name
echo "Add content to the application file?"
read content
sudo  chmod 766 $Dir/$name
sudo echo "$content" >> $Dir/$name

sudo chmod 700 $Dir/$name
echo "Please specify the user that owns this app". 
read owner
sudo grep $owner /etc/passwd
verifyowner=`sudo grep -w $owner /etc/passwd | cut -d: -f1`
echo "value for verified owner is:  $verifyowner"


if [ $owner = $verifyowner ]
 then
 echo "User verified sucessfully"
 else
 echo "Enter a valid user"
 fi

sudo chown $owner $Dir/$name
#sleep 5 
echo "Application deployed successfully"
echo $?

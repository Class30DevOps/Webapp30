#!/bin/bash
# TOMCAT.SH
# Steps for Installing tomcat9 on rhel7&8
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
# https://github.com/LandmakTechnology/package-management/tree/main/Tomcat-installation

# assign hostname for tomcat server
sudo hostnamectl set-hostname tomcat

#navigate to /opt directory and install wget and javaJDK 1.8
cd /opt 
sudo yum install git wget vim -y
sudo yum install java-1.8.0-openjdk-devel -y

# download tomcat software
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz

# extract tomcat software
sudo tar -xvf apache-tomcat-9.0.69.tar.gz

# delete zipped package since we already have the unzipped version
sudo rm apache-tomcat-9.0.69.tar.gz

# rename extracted apache tomcat directory/files
sudo mv apache-tomcat-9.0.69/ tomcat9

# assign permission access
sudo chmod 777 -R /opt/tomcat9

# start tomcat
sudo sh /opt/tomcat9/bin/startup.sh

# create a soft link to start and stop tomcat from anywhere 
# This will enable you to manage tomcat as a service
# ln command will be used to create a link
# /user/bin/starttomcat is a link we'll assign to /opt/tomcat9/bin/startup.sh script. 
# so instead of running the script to start or stop stopcat,  we can just do sudo starttomcat or sudo stoptomcat and to start/stop tomcat. 
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
echo "end on tomcat installation"
#========

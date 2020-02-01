#!/bin/sh
#Update local package index
sudo apt-get update
#Instal java
sudo apt-get install openjdk-8-jdk -y
#This is the Debian package repository of Jenkins to automate installation and upgrade.
#To use this repository, first add the key to your system.
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#Add "deb https://pkg.jenkins.io/debian-stable binary/" in your /etc/apt/sources.list.
sudo sh -c 'echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list'
#Update local package index.
sudo apt-get update
#Install jenkins.
sudo apt-get install jenkins -y
#Start jenkins service.
sudo service jenkins start
#add user 'jenkins' to sudoers file.
#To get sudo permissions to the user 'jenkins'.
sudo usermod -aG sudo jenkins
#Enable PasswordAuthentication in /etc/ssh/sshd_config
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
#restart service sshd
sudo service sshd restart
#set passwd to user 'jenkins'
sudo echo jenkins:jenkins | sudo chpasswd
#****Jenkins configuration is done successfully****
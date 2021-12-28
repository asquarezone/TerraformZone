#!/bin/bash
sudo apt update
sudo apt install openjdk-11-jdk -y
mkdir ~/apps 
cd ~/apps
wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar
java -jar spring-petclinic-2.4.2.jar &
sleep 60s
#!/bin/bash
sudo apt update
sudo apt install unzip dotnet-sdk-8.0 -y
# create a user nop
sudo useradd -m -s /bin/bash nop
sudo mkdir /usr/share/nopCommerce
sudo cp /tmp/nopCommerce.zip /usr/share/nopCommerce/nopCommerce.zip
cd /usr/share/nopCommerce && sudo unzip nopCommerce.zip && sudo mkdir bin logs
sudo chown -R nop:nop /usr/share/nopCommerce
sudo systemctl daemon-reload
sudo systemctl enable nopCommmerce 
sudo systemctl start nopCommerce


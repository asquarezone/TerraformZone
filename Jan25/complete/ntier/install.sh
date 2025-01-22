#!/bin/bash
sudo apt update
sudo apt install nginx unzip -y
cd /tmp
wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
unzip oxer.zip
sudo mv oxer-html /var/www/html/boxer
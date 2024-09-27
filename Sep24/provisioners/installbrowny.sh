#!/bin/bash
sudo apt update
sudo apt install nginx unzip -y
cd /tmp && wget https://www.free-css.com/assets/files/free-css-templates/download/page296/browny.zip
unzip /tmp/browny.zip
sudo mv /tmp/browny-v1.0/ /var/www/html/browny/
cd /tmp && wget https://www.free-css.com/assets/files/free-css-templates/download/page296/inance.zip
unzip /tmp/inance.zip
sudo mv /tmp/inance-html /var/www/html/repairs/
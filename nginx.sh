#!/bin/bash

cd /var/lib/jenkins/workspace/teerdha17

sudo cp -rf nginx.conf /etc/nginx/sites-available/
sudo rm /etc/nginx/sites-enabled/nginx.conf
#sudo ln -s /etc/nginx/sites-available/ /etc/nginx/sites-enabled/nginx.conf
chmod 710 /var/lib/jenkins/workspace/teerdha17

#sudo sed -i 's/80 default_server/81 default_server/g' /etc/nginx/sites-enabled/default

sudo service nginx enable
sudo service nginx start

echo "Nginx has been started"

sudo service nginx status

#!/bin/bash

sudo cp -rf nginx.conf /etc/nginx/sites-available/
chmod 710 /var/lib/jenkins/workspace/teerdha17

sudo nginx -t

#sudo sed -u 's/80 default_server/81 default_server/g' /etc/nginx/sites-enable/default

sudo systemctl restart nginx.service

echo "Nginx has been started"

sudo systemctl status nginx.service

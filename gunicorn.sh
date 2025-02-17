#!/bin/bash

cd /var/lib/jenkins/workspace/teerdha17

$PWD

source praveen/bin/activate
sudo apt install libmysqlclient-dev -y
sudo apt install pkg-config -y
pip install django
pip install gunicorn
pip install django-rest-framework
pip install mysqlclient
pip install requests
pip install pillow
pip install psycopg2-binary

python3 manage.py makemigrations
python3 manage.py migrate

echo "Migrations done"


sudo rm /etc/systemd/system/gunicorn.service
sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"



sudo systemctl daemon-reload
sudo systemctl start gunicorn

echo "Gunicorn has started."

sudo systemctl enable gunicorn

echo "Gunicorn has been enabled."

sudo systemctl restart gunicorn


sudo systemctl status gunicorn

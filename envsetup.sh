#!/bin/bash

# Check if virtualenv is installed
if command -v virtualenv &> /dev/null; then
    echo "virtualenv is already installed."
else
    echo "Installing virtualenv......"
    sudo apt install -y python3-virtualenv
    sudo apt install virtualenv -y
    sudo apt install python3-venv -y
    sudo apt install python3-pip -y
    sudo apt install nginx -y
    sudo apt install gunicorn -y
    sudo apt install libmysqlclient-dev -y
    sudo apt install pkg-congif -y
fi

    python3 -m venv praveen
    
if [ -d "praveen" ]
then
    echo "Python virtual environment exists."
else
    echo "Creating a virtual environment"
    python3 -m venv praveen
fi

echo "The current directory"
echo $PWD
echo -e "\n\n\n"

echo "Activating the virtual environment"
source praveen/bin/activate
echo -e "\n\n\n"

echo -e "\n\n\n"
echo "Installing Requirements...."
pip3 install -r requirements.txt
echo "Requirements Installed."
echo -e "\n\n\n"
pip install --upgrade pip setuptools
pip install wheel
pip wheel --wheel-dir=/tmp/wheelhouse --no-cache-dir -r requirements.txt
pip wheel --verbose --wheel-dir=/tmp/wheelhouse --no-cache-dir -r requirements.txt


echo "Checking for logs"
if [ -d "logs" ]
then
    echo "Log folder exists."
else
    echo "Creating Logs"
    mkdir logs
    touch logs/error.log logs/access.log
fi

echo -e "\n\n\n"
echo "Giving Permission"
sudo chmod -R 777 logs
echo -e "\n\n\n"
echo "*********Script Ended************"

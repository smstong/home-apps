#!/bin/bash

# install apache2
sudo apt install apache2
sudo systemctl enable apache2

# grant www-data to video
sudo usermod -aG audio www-data
sudo usermod -aG video www-data

# enable cgi module
cd /etc/apache2/mods-enabled
sudo ln -s ../mods-available/cgi.load .

# start up
sudo systemctl start apache2

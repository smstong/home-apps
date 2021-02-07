#!/bin/bash

# install apache2
sudo yum install apache2
sudo systemctl enable apache2

# grant www-data to video
sudo usermod -aG audio www-data
sudo usermod -aG video www-data

# enable cgi module
cd /etc/apache2/mods-enabled
sudo ln -s ../mods-available/cgi.load .

# copy all in var_www_html to /var/www/html/
# copy all in usr_lib_cgi-bin to /usr/lib/cgi-bin/

# start up
sudo systemctl start apache2

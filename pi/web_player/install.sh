#!/bin/bash
self_path=$(cd $(dirname $0) && pwd)
cd "$self_path"

cd "$self_path"

# install CGI scripts
scp -r ./usr_lib_cgi-bin/* root@pi:/usr/lib/cgi-bin/

# generate index.html
v1="/mnt/K/public/video" # the path where all movies are located
cd ./generate_var_www_html
./gen_web.sh "$v1" 

# install /var/www/html/
scp -r ./var_www_html/* root@pi:/var/www/html/

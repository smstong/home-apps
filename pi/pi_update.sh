#!/bin/bash
self_path=$(cd "$(dirname $0)" && pwd)

# copy all in var_www_html to /var/www/html/
rsync -r --delete "$self_path/var_www_html/" root@pi:/var/www/html/
rsync -r --delete "$self_path/usr_lib_cgi-bin/" root@pi:/usr/lib/cgi-bin/
rsync -r --delete "$self_path/home_pi_scripts/" pi@pi:/home/pi/scripts/

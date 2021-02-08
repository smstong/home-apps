#!/bin/bash
self_path=$(cd "$(dirname $0)" && pwd)

cd "$self_path"

# call ./*/install.sh
for install_script in ./*/install.sh
do
    echo "calling $install_script..."
    "$install_script"
done

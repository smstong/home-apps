#!/bin/bash
self_path=$(cd $(dirname $0) && pwd)
function usage()
{
    echo $(basename $0) path1 ...
}

if [[ $# -eq 0 ]]; then
    usage
    exit
fi

rows=$(
while [[ $# -ne 0 ]]
do
    vpath=$(cd "$1" && pwd) # absolute path
    find "$vpath" -name "*.mp4" -o -name "*.rmvb" | sort | \
        while read i
        do
            cat "${self_path}/tr.html.tpl" | \
                sed -e "sPATH_OF_MOVIE$i"
        done
    shift
done 
)

rows=$(echo "$rows" | sed -ne 'H;${x;s:\n:\\n:gp}')

cat "${self_path}/index.html.tpl" | \
    sed -e "sPLAYLIST_ROWS$rows"


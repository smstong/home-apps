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

web_root="${self_path}/var_www_html"
if [[ ! -d "$web_root" ]]; then
    mkdir "$web_root"
fi

cp -f "$self_path/index.css" "${web_root}"

rows=$(
while [[ $# -ne 0 ]]
do
    vpath=$(cd "$1" && pwd) # absolute path
    find "$vpath" -name "*.mp4" \
        -o -name "*.rmvb" \
        -o -name "*.mkv" | sort | \
        while read i
        do
            cat "${self_path}/tr.html.tpl" | \
                sed -e "sPATH_OF_MOVIE$i"
        done
    shift
done 
)

#rows=$(echo "$rows" | sed -ne 'H;${x;s:\n:\\n:gp}')
echo "$rows" > rows.tmp

cat "${self_path}/index.html.tpl" | \
    sed -e "/PLAYLIST_ROWS/r rows.tmp" -e "/PLAYLIST_ROWS/d" | \
    tee "${web_root}/index.html" > /dev/null

rm -f rows.tmp


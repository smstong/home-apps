#!/bin/bash
echo 'Content-Type: text/plain; ; charset=utf-8'
echo

function urldecode(){
	echo "$@" | \
	sed -e 's/+/ /g' | \
	sed -e 's/%/\\\\x/g' | \
	xargs echo -e
}
requestStr=$(urldecode ${QUERY_STRING})

echo $requestStr
# parse query string
arr=($(echo $requestStr | sed -e 's/&/ /g'))
for i in ${arr[@]}
do
	k=$(echo "$i"|cut -d= -f1)
	v=$(echo "$i"|cut -d= -f2)
	if [[ $k == "action" ]]; then
		action="$v"
	fi
	if [[ $k == "path" ]]; then
		path="$v"
	fi
	if [[ $k == "startTime" ]]; then
		startTime="$v"
	fi
done

echo "action is $action"
echo "path is $path"

if [[ $action == "start" ]]; then
	echo "starting..."
	./do_player.sh start "$path" "$startTime" &
elif [[ $action == "stop" ]]; then
	echo "stopping..."
	./do_player.sh stop >/dev/null 2>&1 &
elif [[ $action == "pause" ]]; then
	echo "pausing..."
	./do_player.sh pause >/dev/null 2>&1 &
elif [[ $action == "resume" ]]; then
	echo "resuming..."
	./do_player.sh resume >/dev/null 2>&1 &
else
	:
fi

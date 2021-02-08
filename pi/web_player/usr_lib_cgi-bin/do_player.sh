#!/bin/bash
		
PLAYER='/usr/bin/omxplayer.bin --adev hdmi'
PROCESS_NAME="omxplayer.bin"

function stop()
{
	pkill -9 "$PROCESS_NAME"
}

# start path_of_file start_time
function start()
{
	stop
	$PLAYER --pos "$2" "$1"
}

function pause()
{
	pkill -19 "$PROCESS_NAME"
}

function resume()
{
	pkill -18 "$PROCESS_NAME"
}


case $1 in
"start")
	start "$2" "$3"
	;;
"stop")
	stop
	;;
"pause")
	pause
	;;
"resume")
	resume
	;;
*)
	;;
esac

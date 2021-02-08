#!/bin/bash

PLAYER='/usr/bin/omxplayer --adev hdmi'
TIMEOUT=10

i=0
while [[ $# -gt 0 ]]
do
	if [[ $i -ne 0 ]]; then
		echo "Will play [$i]:<$1> in ${TIMEOUT} seconds, press [Q|q] to quit"
		input='Yes'
		read -t ${TIMEOUT} input
		if [[ $input == 'Q' ]] || [[ $input == 'q' ]]; then
			exit
		fi
	fi
	${PLAYER} "$1"
	shift
	i=$((i+1))
done


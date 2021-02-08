#!/bin/bash
self_path=$(cd "$(dirname $0)" && pwd)

scp -r "$self_path"/* pi@pi:/home/pi/scripts/

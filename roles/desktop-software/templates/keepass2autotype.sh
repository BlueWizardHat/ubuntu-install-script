#!/usr/bin/env bash

PID=$(ps x | grep [k]eepass2/KeePass.exe | awk {'print $1'})
if [ -z "$PID" ]; then
	nohup keepass2 > /dev/null 2>&1 &
else
	sleep 0.5 && keepass2 --auto-type
fi

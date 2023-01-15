#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/config.sh"
. "$DIR/util.sh"

me="`basename $0`"

exec 200>$inlo
if ! flock -xn 200; then
	errcho "[$me] Failed to aquire lock, exiting..." && exit 1
fi

cleanup(){
	if [[ -f $inpidfi ]]; then
		errcho "[$me] Removing Input pid file..."
		rm -f $inpidfi
	fi
	errcho "[$me] Removing Input lock file..."
	flock -u 200
	flock -xn 200 && rm -f $inlo
}

trap cleanup EXIT

errcho "[$me] Starting input stream..."
sleep 5
ffmpeg -loglevel warning -re -live_start_index -6 -i $rtmphls -c copy -f flv $rtmpi &
inpid=$!
errcho "[$me] Input stream pid $inpid"
echo $inpid > $inpidfi
wait $inpid
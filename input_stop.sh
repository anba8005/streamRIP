#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/config.sh"
. "$DIR/util.sh"

me="`basename $0`"

if [[ -f $inpidfi ]]; then
	onpid=$(<$inpidfi)
	errcho "[$me] Stopping online stream (pid $inpid)..."
	rm -f $inpidfi
	kill $inpid
fi

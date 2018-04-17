#!/bin/sh

if [ "$#" -lt 2 ]; then
	echo -e "$0: Insufficient arguments" >&2
	exit -1
fi

ln -s "../base_$1_auto.sh" "$2.sh"
ln -s "../base_$1_auto.sh" "$2_i686.sh"
ln -s "../base_$1_auto.sh" "$2_x86_64.sh"


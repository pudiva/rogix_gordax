#!/bin/sh

for arg do
	cat "$arg" | while read line; do
		bkp="$line~"
	
		if [ -f "$bkp" -o -L "$bkp" ]; then
			rm -f "$bkp"
		fi
	done
done


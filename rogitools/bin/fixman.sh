#!/bin/sh

_0=`basename "$0"`

eecho()
{
	echo -e "$_0: $@." >&2
}

# check arguments
if [ "$#" -lt 1 ]; then
	eecho "Usage: $_0 pkg..."
	exit -1
fi

for pkg do
	name=`basename "$pkg" .tar`
	dir=`mktemp -d`

	unset mod
	tar -C "$dir" -xf "$pkg"

	if [ "$?" -ne 0 ]; then
		eecho "$pkg: failed to extract"
		exit -1
	fi

	if [ -d "$dir/man" ]; then
		mod=1
		mkdir -p "$dir/usr/share"
		mv "$dir/man" "$dir/usr/share/man"
	fi

	if [ -d "$dir/usr/man" ]; then
		mod=1
		mkdir -p "$dir/usr/share"
		mv "$dir/usr/man" "$dir/usr/share/man"
	fi

	if [ $mod ]; then
		mv "$pkg" "$pkg.orig"
		mkrogipkg "$name" "$dir"
	fi
done


#!/bin/sh

_0=`basename "$0"`

eecho()
{
	echo -e "$_0: $@." >&2
}

stub()
{
	cat << EOF
/* by rogi <rogi@linuxmail.org> */
#ifdef __x86_64__
#include "$1"
#else /* __x86_64__ */
#include "$2"
#endif /* __x86_64__ */
EOF
}

# check arguments
if [ "$#" -ne 2 ]; then
	eecho "Usage: $_0 pkg64 pkg32"
	exit -1
fi

pkg64=`readlink -f "$1"`
pkg32=`readlink -f "$2"`

name64=`basename "$pkg64" .tar`
name32=`basename "$pkg32" .tar`

if [ ! "$pkg64" ] || [ ! "$pkg32" ]; then
	eecho "Invalid arguments"
	exit -1
fi

dir=`mktemp -d`
dir64="$dir/64"
dir32="$dir/32"

# start stuff
mkdir -p "$dir64" && \
mkdir -p "$dir32" && \
tar -C "$dir64" -xf "$pkg64" && \
tar -C "$dir32" -xf "$pkg32"

if [ "$?" -ne 0 ]; then
	eecho "$@"
	eecho "Failed to extract packages"
	exit -1
fi

find "$dir64" | grep '\.h$' | while read line; do
	f64="$line"
	f32=`sed -e "s#^$dir64#$dir32#" <<< "$line"`

	# skip files that dont match
	if [ ! -e "$f64" -o ! -e "$f32" ]; then
		continue
	fi

	diff -q "$f64" "$f32" &> /dev/null

	# skip equal files
	if [ "$?" -eq 0 ]; then
		continue
	elif [ "$?" -eq 2 ]; then
		eecho "$@"
		eecho "diff fucked things up! aborting!"
		exit -1
	fi

	nf64=`sed -e 's/\.h$/__x86_64__.h/' <<< "$f64"`
	nf32=`sed -e 's/\.h$/__i686__.h/' <<< "$f32"`

	mv "$f64" "$nf64"
	mv "$f32" "$nf32"

	p64=`basename "$nf64"`
	p32=`basename "$nf32"`

	stub "$p64" "$p32" > "$f64"
	stub "$p64" "$p32" > "$f32"
done

mv "$pkg64" "$pkg64.orig"
mv "$pkg32" "$pkg32.orig"

mkrogipkg "$name64" "$dir64"
mkrogipkg "$name32" "$dir32"

#rogipkg_install "$1"
#rogipkg_install "$2"


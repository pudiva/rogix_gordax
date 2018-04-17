#!/bin/sh

_0=`basename $0`

eecho()
{
	echo -e "$_0: $@." >&2
}

if [ "$#" -lt 2 ]; then
	eecho "Insufficient arguments"
	exit -1
fi

cat "$1" | while read line; do
	pkgname="`basename "$line"`_$2"
	pkgdir=`dirname "$line"`

	rogipkg_installed "$pkgname"
	if [ "$?" -eq 1 ]; then
#		rogipkg_remove "$pkgname"
		continue
	fi

	(
	cd "$pkgdir" && \
	gnubuilder -c "final/XORG-7.5/$pkgdir/$pkgname.sh" && \
	rogipkg_install "$pkgname.tar" && \
	mkdir -p "/rogix/packages/final/XORG-7.5/$pkgdir" &&  \
	mv "$pkgname.tar" "/rogix/packages/final/XORG-7.5/$pkgdir/"
	)

	if [ "$?" -ne 0 ]; then
		eecho "$line: failed"
		break
	fi
done

exit $?

#!/bin/sh

pkgname=`basename "$buildscript_name" .sh`

case "$pkgname" in
*_x86_64)
	. "$BUILDSCRIPTS_DIR/base_x86_64.sh";;
*_i686)
	. "$BUILDSCRIPTS_DIR/base_i686.sh";;
*)
	. "$BUILDSCRIPTS_DIR/base_x86_64.sh";;
esac


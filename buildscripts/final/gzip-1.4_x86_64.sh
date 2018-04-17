#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr"

export CC="gcc -static"
export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native"

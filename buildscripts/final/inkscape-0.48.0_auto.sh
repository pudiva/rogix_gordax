#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--disable-poppler-cairo
"

export LDFLAGS="$LDFLAGS -L/usr/X11R7/lib64"
export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native -I/usr/X11R7/include"
export CXXFLAGS="$CFLAGS"

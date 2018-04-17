#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--prefix=/usr"

export CFLAGS="$CFLAGS -I/usr/X11R7/include"
export LDFLAGS="$LDFLAGS -L/usr/X11R7/lib64"

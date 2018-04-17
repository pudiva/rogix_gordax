#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--enable-xcb
--enable-glx-tls
"

export LDFLAGS="-L/lib64 -L/usr/lib64 -L/usr/X11R7/lib64 -L/usr/local/lib64 \
-L/usr/local/ssl/lib64 -L/lib -L/usr/lib -L/usr/X11R7/lib -L/usr/local/lib \
-L/usr/local/ssl/lib"

objdir="$srcdir"

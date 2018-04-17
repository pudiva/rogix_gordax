#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--enable-32-bit
--enable-xcb

--with-dri-driverdir=/usr/lib$qual/dri
--with-dri-drivers=
--with-gallium-drivers=r600
"

export LDFLAGS="-L/lib$qual -L/usr/lib$qual -L/usr/X11R7/lib$qual -L/usr/local/lib$qual"

srcdir='mesa'
objdir="$srcdir"

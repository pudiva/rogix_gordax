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

--enable-gles2

--with-dri-driverdir=/usr/lib$qual/dri
--with-dri-drivers=i965
--with-gallium-drivers=r600,i915
"

export LDFLAGS="-L/lib$qual -L/usr/lib$qual -L/usr/X11R7/lib$qual -L/usr/local/lib$qual"

objdir="$srcdir"

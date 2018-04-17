#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--x-include=/usr/X11R7/include
--x-libraries=/usr/X11R7/lib64

--with-freetype2-library=/usr/lib64
--with-freetype2-includes=/usr/include/freetype2

--with-Xm-includes=/usr/include
--with-Xm-library=/usr/lib64
"

export CFLAGS="$CFLAGS -I/usr/X11R7/include"
export LDFLAGS="$LDFLAGS -L/usr/X11R7/lib64"

objdir="$srcdir"

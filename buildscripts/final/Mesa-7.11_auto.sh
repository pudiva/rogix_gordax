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

#export LDFLAGS="-L/lib64 -L/usr/lib64 -L/usr/X11R7/lib64 -L/usr/local/lib64 \
#-L/lib -L/usr/lib -L/usr/X11R7/lib -L/usr/local/lib"
export LDFLAGS="-L/lib$qual -L/usr/lib$qual -L/usr/X11R7/lib$qual -L/usr/local/lib$qual"

objdir="$srcdir"

#--enable-glx-tls
#--with-dri-driverdir=/usr/lib${LIBDIRSUFFIX}/xorg/modules/dri 
#--enable-gallium-nouveau
#--enable-xorg
#--with-dri-drivers=r600,radeon,swrast

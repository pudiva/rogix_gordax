#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--prefix=/usr
--sysconfdir=/etc

--audio-drv-list=alsa

--extra-cflags=-I/usr/X11R7/include
--extra-ldflags=-L/usr/X11R7/lib64
"

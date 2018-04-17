#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--prefix=/usr
--sysconfdir=/etc

--enable-sdl
--enable-kvm

--audio-drv-list=alsa,oss,sdl
--audio-card-list=ac97,es1370,sb16,hda

--disable-cpu-emulation
--disable-system

--extra-cflags=-I/usr/X11R7/include
--extra-ldflags=-L/usr/X11R7/lib64
"

objdir="$srcdir"

#--enable-spice
#--enable-uuid
#--enable-user
#--enable-linux-user
#--enable-doc
#--enable-cpu-emulation
#--enable-system

#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--prefix=/usr
--sysconfdir=/etc

--target-list=i386-softmmu,x86_64-softmmu,i386-linux-user,x86_64-linux-user

--enable-sdl
--enable-kvm
--enable-docs
--enable-system

--cpu=x86_64

--audio-drv-list=alsa,oss,sdl
--audio-card-list=ac97,es1370,sb16,hda

--extra-cflags=-I/usr/X11R7/include
--extra-ldflags=-L/usr/X11R7/lib64
"

make="make -j4"
objdir="$srcdir"

export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native"
export CXXFLAGS="$CFLAGS"

#--disable-cpu-emulation
#--disable-system

#--enable-spice
#--enable-uuid
#--enable-user
#--enable-linux-user
#--enable-doc
#--enable-cpu-emulation
#--enable-system

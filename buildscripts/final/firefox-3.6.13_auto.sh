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

--with-x
--with-pthreads
--with-distribution-id=IndexLibrorumProhibitorum

--enable-application=browser
--enable-default-toolkit=cairo-gtk2
--enable-official-branding
--enable-strip
--enable-faststart

--disable-accessibility
--disable-installer
--disable-updater
--disable-parental-controls
--disable-debug
--disable-dbus
--disable-libnotify
--disable-necko-wifi
--disable-crashreporter
"

export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native"

srcdir="mozilla-1.9.2"
objdir="$srcdir"

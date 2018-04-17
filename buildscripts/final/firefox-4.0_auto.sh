#!/bin/sh
#
# base buildscript for auto
#
#
#. "$BUILDSCRIPTS_DIR/base_auto.sh"
#
#configure_options="\
#$configure_options
#--prefix=/usr
#
#--x-include=/usr/X11R7/include
#--x-libraries=/usr/X11R7/lib64
#
#--with-x
#--with-pthreads
#--with-distribution-id=IndexLibrorumProhibitorum
#
#--enable-application=browser
#--enable-default-toolkit=cairo-gtk2
#--enable-official-branding
#--enable-strip
#--enable-faststart
#
#--disable-accessibility
#--disable-installer
#--disable-updater
#--disable-parental-controls
#--disable-debug
#--disable-dbus
#--disable-libnotify
#--disable-necko-wifi
#--disable-crashreporter
#"

#export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native -I/usr/X11R7/include"
#export LDFLAGS="-L/usr/X11R7/lib64"

#srcdir="mozilla-2.0"
#objdir="$srcdir"

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--x-include=/usr/X11R7/include
--x-libraries=/usr/X11R7/lib64

--with-x
--with-pthreads
--with-distribution-id=IndexLibrorumProhibitorum
--with-system-zlib

--enable-application=browser
--enable-default-toolkit=cairo-gtk2
--enable-system-cairo
--enable-official-branding
--enable-strip
--enable-crypto
--enable-svg
--enable-canvas
--enable-logging
--enable-xft
--enable-webm
--enable-optimize
--enable-cpp-rtti

--disable-accessibility
--disable-installer
--disable-updater
--disable-parental-controls
--disable-debug
--disable-dbus
--disable-libnotify
--disable-necko-wifi
--disable-crashreporter
--disable-composer
--disable-tests
--disable-mailnews
--disable-pedantic
--disable-ldap
"

export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native -I/usr/X11R7/include"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-L/usr/X11R7/lib64"

srcdir="mozilla-2.0"
objdir="$srcdir"

#-enable-startup-notification \
#--enable-reorder \
#--enable-single-profile \
#--disable-profilesharing

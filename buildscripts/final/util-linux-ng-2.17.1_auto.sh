#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options

--prefix=/

--enable-login-utils
--enable-arch
--enable-elvtune
--enable-init
--enable-kill
--enable-last
--enable-mesg
--enable-partx
--enable-raw
--enable-rdev
--enable-reset
--enable-write
--enable-login-stat-mail

--disable-libuuid
--disable-libblkid
"

#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--host=x86_64-IndexLibrorumProhibitorum-linux
--build=i686-IndexLibrorumProhibitorum-linux

--prefix=/

--disable-makeinstall-chown
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
"

#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--host=x86_64-IndexLibrorumProhibitorum-linux
--build=i686-IndexLibrorumProhibitorum-linux
--target=x86_64-IndexLibrorumProhibitorum-linux

--prefix=/usr

--enable-languages=c,c++
--enable-long-long
--enable-c99
--enable-threads=posix
--enable-__cxa_atexit

--disable-libstdcxx-pch
"

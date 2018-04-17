#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--host=i686-IndexLibrorumProhibitorum-linux
--build=i686-IndexLibrorumProhibitorum-linux
--target=x86_64-IndexLibrorumProhibitorum-linux

--prefix=$TOOLCHAIN_DIR

--with-sysroot=$TOOLCHAIN_DIR

--enable-languages=c,c++
--enable-__cxa_atexit
--enable-long-long
--enable-c99
--enable-shared
--enable-threads=posix

--disable-nls
--disable-debug
"

srcdir="gcc-4.4.3"

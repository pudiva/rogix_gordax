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

--enable-languages=c
--enable-__cxa_atexit
--enable-long-long
--enable-c99

--disable-shared
--disable-threads
--disable-nls
"

srcdir="gcc-4.4.3"

targets="all-gcc all-target-libgcc"
install_targets="install-gcc install-target-libgcc"

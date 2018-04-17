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

--enable-64bit-bfd
--enable-shared

--disable-werror
--disable-nls
"

srcdir="binutils-2.20"

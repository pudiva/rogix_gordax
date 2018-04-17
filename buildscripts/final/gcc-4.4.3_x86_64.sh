#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--target=x86_64-IndexLibrorumProhibitorum-linux

--prefix=/usr

--enable-languages=all
--enable-long-long
--enable-c99
--enable-threads=posix
--enable-__cxa_atexit

--enable-bootstrap
"

make="make -j 4"

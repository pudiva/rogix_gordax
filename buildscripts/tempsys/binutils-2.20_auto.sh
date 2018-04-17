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

--enable-64bit-bfd
--enable-shared
--enable-threads
"

overrides="tooldir=/usr"

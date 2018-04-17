#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--target=x86_64-IndexLibrorumProhibitorum-linux

--prefix=/usr

--enable-64bit-bfd
"

overrides="tooldir=/usr"

#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr
--with-threads
--enable-shared
--enable-ipv6
--disable-profiling
"

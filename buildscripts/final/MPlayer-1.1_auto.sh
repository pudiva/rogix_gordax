#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--prefix=/usr
--extra-cflags=-march=native

--prefix=/usr
--confdir=/etc
--libdir=/usr/lib64
--codecsdir=/usr/local/lib/codecs

--disable-gui
--disable-runtime-cpudetection

--language=en

--enable-mmx
--enable-sse2
--enable-ssse3
--enable-gl
--enable-mpg123
"

unset CFLAGS

skip_destdir_var_check=1
objdir="$srcdir"

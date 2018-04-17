#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--prefix=/usr

--libdir=/usr/lib64

--with-toolset=gcc
"

objdir="$srcdir"

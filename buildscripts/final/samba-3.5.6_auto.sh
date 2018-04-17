#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--with-fhs
--with-piddir=/var/run
--with-cifsmount
"

srcdir="samba-3.5.6/source3"
objdir="$srcdir"

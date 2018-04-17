#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr"

srcdir="audacity-src-1.3.13-beta"
objdir="$srcdir"

#!/bin/sh
#
# base buildscript for XORG-7.5 x86_64
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options

--prefix=/usr/X11R7
"

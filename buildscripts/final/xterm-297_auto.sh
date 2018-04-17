#!/bin/sh
#
# base buildscript for XORG-7.6 x86_64
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options

--prefix=/usr/X11R7

--enable-freetype
--enable-256-color
--enable-readline-mouse
--enable-wide-chars

"

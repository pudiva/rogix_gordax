#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--enable-xlib

--enable-tee
--enable-gobject
"

#--enable-xcb
#--enable-xlib-xcb

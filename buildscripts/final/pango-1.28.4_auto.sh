#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--enable-man

--x-include=/usr/X11R7/include
--x-libraries=/usr/X11R7/lib$qual
"

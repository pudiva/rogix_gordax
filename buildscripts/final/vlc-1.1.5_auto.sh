#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--disable-mad
--disable-a52
--disable-postproc

--disable-qt4
--disable-skins2

--x-include=/usr/X11R7/include
--x-libraries=/usr/X11R7/lib64
"

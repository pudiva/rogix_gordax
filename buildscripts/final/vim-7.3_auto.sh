#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--x-includes=/usr/X11R7/include
--x-libraries=/usr/X11R7/lib64

--with-compiledby=Zeh

--enable-perlinterp
--enable-pythoninterp
--enable-multibyte
--enable-fontset

--enable-gui
"

srcdir="vim73/src"
objdir="$srcdir"

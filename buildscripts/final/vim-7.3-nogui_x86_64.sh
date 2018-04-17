#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr




--with-compiledby=Zeh

--enable-perlinterp
--enable-pythoninterp
--enable-multibyte



"

srcdir="vim73/src"
objdir="$srcdir"

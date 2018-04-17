#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr
--enable-http

--enable-splibdir=/usr/lib
"

objdir="$srcdir"
install_targets="$install_targets install-man"

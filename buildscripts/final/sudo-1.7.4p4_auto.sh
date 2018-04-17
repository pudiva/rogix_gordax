#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--with-ignore-dot
--with-all-insults

--enable-shell-sets-home
--enable-noargs-shell

--without-pam

--disable-root-sudo
"

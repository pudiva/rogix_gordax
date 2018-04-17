#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--host=x86_64-IndexLibrorumProhibitorum-linux
--build=i686-IndexLibrorumProhibitorum-linux

--prefix=$TOOLCHAIN_DIR

--with-headers=$TOOLCHAIN_DIR/include

--enable-kernel=2.6.35.4

--disable-add-ons
--disable-sanity-checks
--disable-profile
--disable-debug
"

srcdir="glibc-2.11"
install_targets="install-headers"

destdir_var="install_root"

skip_make=1
skip_destdir_var_check=1

#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--with-tls
--with-__thread

--enable-add-ons
--enable-kernel=2.6.35.4

--disable-profile
--disable-debug
"

srcdir="glibc-2.11"
destdir_var="install_root"
overrides="slibdir=/lib64"
install_targets="install localedata/install-locales"

skip_destdir_var_check=1

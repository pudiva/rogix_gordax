#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
--host=x86_64-IndexLibrorumProhibitorum-linux
--build=i686-IndexLibrorumProhibitorum-linux

--prefix=/usr

--with-headers=$TEMPSYS_DIR/usr/include

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

export libc_cv_forced_unwind=yes
export libc_cv_c_cleanup=yes

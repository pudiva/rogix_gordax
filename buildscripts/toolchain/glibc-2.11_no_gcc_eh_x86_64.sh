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

--with-tls
--with-__thread

--enable-add-ons
--enable-kernel=2.6.35.4

--disable-profile
--disable-debug
"

srcdir="glibc-2.11"
overrides="slibdir=$TOOLCHAIN_DIR/lib64"
destdir_var="install_root"

skip_destdir_var_check=1

export libc_cv_forced_unwind=yes
export libc_cv_c_cleanup=yes

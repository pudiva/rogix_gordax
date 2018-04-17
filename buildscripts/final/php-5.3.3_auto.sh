#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--sysconfdir=/etc/php

--enable-zip

--with-readline
--with-zlib
--with-openssl
--with-zlib
--with-bz2
--with-mysql
--with-mysqli
--with-apxs2=/usr/sbin/apxs
--with-openssl-dir=/usr/local/ssl
--with-layout=GNU

--without-pear
"

export USE_ARCH="64"
export MYSQL_LIB_DIR="/usr/lib64"

export CFLAGS="-O2 -pipe -fomit-frame-pointer -march=native"
export LDFLAGS="-L/usr/lib64/mysql"

destdir_var="INSTALL_ROOT"
install_targets="install-programs install-cli install-sapi"

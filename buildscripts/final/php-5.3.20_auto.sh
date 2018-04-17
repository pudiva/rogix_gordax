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
--enable-pdo
--enable-inifile

--enable-soap
--enable-libxml

--with-gd
--with-curl
--with-xsl

--with-readline

--with-zlib
--with-bz2

--with-openssl
--with-openssl-dir=/usr/local/ssl

--with-mysql
--with-mysqli
--with-pdo-mysql

--with-sqlite
--with-pdo-sqlite

--with-apxs2=/usr/sbin/apxs

--with-layout=GNU

--disable-debug

--without-pear
"

destdir_var="INSTALL_ROOT"
install_targets="install-sapi install-programs"
#--disable-cgi
#--disable-cli

#--with-tidy

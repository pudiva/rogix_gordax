#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--sysconfdir=/etc/squid

--enable-default-err-language=English
--enable-shared
--enable-linux-netfilter
--enable-ssl

--with-openssl=/usr/local/ssl
"

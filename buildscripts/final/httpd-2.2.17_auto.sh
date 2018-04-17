#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--enable-layout=IndexLibrorumProhibitorum

--enable-rewrite
--enable-so
--enable-ssl

--enable-mods-shared=all

--with-ssl=/usr/local/ssl
"

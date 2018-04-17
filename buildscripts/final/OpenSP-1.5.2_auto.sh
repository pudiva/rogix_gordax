#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--enable-default-catalog=/etc/sgml/catalog
--enable-default-search-path=/usr/share/sgml

--enable-http

--enable-html
--enable-xml-messages
"

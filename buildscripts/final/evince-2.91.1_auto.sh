#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--disable-schemas-compile
--disable-scrollkeeper
--disable-dbus
--disable-nautilus
--disable-thumbnailer
--disable-previewer
--disable-introspection

--without-gconf
--without-keyring
"

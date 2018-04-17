#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--libexecdir=/usr/sbin

--disable-syslogd
--disable-hostname
--disable-ping
--disable-ping6
--disable-logger
--disable-ifconfig
"

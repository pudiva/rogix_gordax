#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--libexecdir=/usr/sbin
--localstatedir=/srv/mysql

--enable-assembler
--enable-local-infile
--enable-thread-safe-client

--with-readline
--with-pthread
--with-geometry

--with-docs

--with-charset=latin1
--with-extra-charsets=all
--with-mysqld-user=mysql
--with-unix-socket-path=/var/run/mysql/mysql.sock
--with-plugins=csv,myisam,innobase

--without-debug
--without-pstack
"

export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native"
export CXXFLAGS="$CFLAGS -fno-exceptions -fno-rtti -felide-constructors"

#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/usr

--libexecdir=/usr/sbin
--localstatedir=/var/lib/mysql

--enable-assembler
--enable-local-infile
--enable-thread-safe-client

--with-charset=latin1
--with-extra-charsets=all
--with-unix-socket-path=/var/run/mysql/mysql.sock
--with-plugins=myisam,innobase
--with-ssl

--without-debug
--without-readline
"

export CC="gcc"
export CXX="gcc"

export CFLAGS="-O3 -pipe -fomit-frame-pointer -march=native"
export CXXFLAGS="$CFLAGS -fno-exceptions -fno-rtti -felide-constructors"

overrides="benchdir_root=/tmp/mysql-bench"

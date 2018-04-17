#!/bin/sh
#
# base buildscript
#

if [ ! "$arch" ]; then
	arch='x86_64'
fi

if [ ! "$CFLAGS" ]; then
	export CFLAGS='-O2 -march=native -fomit-frame-pointer -pipe'
fi

if [ ! "$LDFLAGS" ]; then
	export LDFLAGS=
fi

if [ ! "$CONFIG_SITE" ]; then
	export CONFIG_SITE='/GORDAX/gordax/config.site'
fi

make="make"
#make="make -j 4"

# strip directory name and .sh suffix
pkgname=`basename "$buildscript_name" .sh`

# strip _i686 suffix for srcdir
srcdir=`sed -e "s/_$arch\$//" <<< "$pkgname"`
objdir="$pkgname"_objdir
destdir="$pkgname"_destdir

configure_options="\
--host=$arch-IndexLibrorumProhibitorum-linux
--build=$arch-IndexLibrorumProhibitorum-linux"
#--target=$arch-IndexLibrorumProhibitorum-linux"
targets=""
install_targets="install"

overrides=""
destdir_var="DESTDIR"

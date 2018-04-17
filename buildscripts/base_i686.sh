#!/bin/sh
#
# base buildscript for i686
#

arch='i686'
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH_i686:$PKG_CONFIG_PATH_x86_64"

. "$BUILDSCRIPTS_DIR/base.sh"

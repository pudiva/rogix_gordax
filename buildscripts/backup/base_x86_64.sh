#!/bin/sh
#
# base buildscript for x86_64
#

arch='x86_64'
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH_x86_64:$PKG_CONFIG_PATH_i686"
export qual='64'

. "$BUILDSCRIPTS_DIR/base.sh"

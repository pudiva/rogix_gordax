#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

objdir="$srcdir"
skip_configure=1
overrides="lib64=lib64"

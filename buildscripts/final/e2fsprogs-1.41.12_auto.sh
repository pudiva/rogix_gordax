#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options
--prefix=/

--with-root-prefix=/

--enable-fsck
--enable-elf-shlibs

--disable-evms
"

install_targets="install install-libs"
skip_destdir_var_check=1

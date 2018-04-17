#!/bin/sh
#
# base buildscript for auto
#

. "$BUILDSCRIPTS_DIR/base_auto.sh"

configure_options="\
$configure_options

--prefix=/usr

--with-tlib=ncurses

--without-x

--disable-gui
"

export vim_cv_memmove_handles_overlap=yes
export ac_cv_sizeof_int=4
export vim_cv_stat_ignores_slash=no
export vim_cv_getcwd_broken=no
export vim_cv_tty_group=tty
export vim_cv_tty_mode=0620
export vim_cv_terminfo=yes
export vim_cv_toupper_broken=no

srcdir="vim73"
objdir="$srcdir"

skip_destdir_var_check=1

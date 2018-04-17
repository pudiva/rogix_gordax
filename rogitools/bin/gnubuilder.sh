#!/bin/sh
#
# Rogi's GNU Crapware builder v4
#

if [ ! "$BUILDSCRIPTS_DIR" ]; then
	BUILDSCRIPTS_DIR=/rogix/buildscripts
fi

eecho()
{
	echo -e "$_0: $@." >&2
}

# makeopts, targets, objdir, overrides
gnubuilder_make()
(
	makeopts="$1"
	targets="$2"
	objdir=`readlink -f "$3"`
	overrides="$4"

	if [ ! -d "$objdir" ]; then
		mkdir -p "$objdir"
	fi

	cd "$objdir"

	if [ "$?" -ne 0 ]; then
		return -- -1
	fi

	$make $makeopts $targets $overrides

	return $?
)

# options, srcdir, objdir
gnubuilder_configure()
(
	options="$1"
	srcdir=`readlink -f "$2"`
	objdir=`readlink -f "$3"`

	if [ ! -d "$objdir" ]; then
		mkdir -p "$objdir"
	fi

	cd "$objdir"

	if [ "$?" -ne 0 ]; then
		return -- -1
	fi

	"$srcdir/configure" $options

	return $?
)

# makeopts, install_targets, pkgname, objdir, destdir_var, 
#	skip_destdir_var_check,	destdir, overrides
gnubuilder_package()
(
	makeopts="$1"
	install_targets="$2"
	pkgname="$3"
	objdir=`readlink -f "$4"`
	destdir_var="$5"
	skip_destdir_var_check="$6"
	destdir=`readlink -f "$7"`
	overrides="$8"

	if [ ! "$skip_destdir_var_check" ]; then
		# does not use -s or -q with grep as its not portable
		gnubuilder_make \
			"$makeopts -p -n" "$install_targets" "$objdir" \
			"$overrides $destdir_var=\"$destdir\"" \
			| grep -- "$destdir_var" &> /dev/null

		# Makefile does not support DESTDIR
		if [ "$?" -ne 0 ]; then
			return -- -1
		fi
	fi

	gnubuilder_make \
		"$makeopts" "$install_targets" "$objdir" \
		"$overrides $destdir_var=\"$destdir\""

	if [ "$?" -ne 0 ]; then
		return -- -1
	fi

	mkrogipkg "$pkgname" "$destdir"

	return $?
)

#
# teh body of teh script
#

_0=`basename "$0"`

version_info="4.0"

help_info="\
Rogi's GNU Crapware builder version $version_info.
Build motherfucking ./configure based backages, you motherfucker.

Usage: $_0 [options] buildscript

Options:
  --			end of options (for packages beginning with '-')
  -C, --skip-configure	skip configure step
  -M, --skip-make	skip make step
  -P, --skip-package	skip package step
  -V, --version		prints teh version string and exit
  -c, --clean		clean package objdir before building
  -h, --help		pretty self explanatory

Unrecognized options and excess arguments will be silently ignored.

The value of teh environment variable BUILDSCRIPTS_DIR is used as teh paths to
teh directory containing teh buildscripts.

Exit status:
  0 if teh package was processed successfuly
  -1 otherwise

Rogi <rogi@linuxmail.org>"

#
# parse teh damn options
#

#clean=1
#skip_configure=1
#skip_make=1
#skip_package=1

for arg do
	case "$arg" in

	# --help -h
	--help | -h )
		echo -e "$help_info"
		exit 0;;

	# --version -V
	--version | -V )
		echo -e "$version_info"
		exit 0;;

	# --clean -c
	--clean | -c )
		clean=1
		shift;;

	# --skip-configure -C
	--skip-configure | -C )
		skip_configure=1
		shift;;

	# --skip-make -M
	--skip-make | -M )
		skip_make=1
		shift;;

	# --skip-package -P
	--skip-package | -P )
		skip_package=1
		shift;;

	# silently ignores invalid options
	--* | -* )
		shift;;

	# stop parsing options after "--"
	-- )
		shift
		break;;

	# no more options
	* )
		break;;
	esac
done

#
# parse teh damn arguments
#
if [ "$#" -lt 1 ]; then
	eecho "Insufficient arguments"
	exit -1
fi

buildscript_name="$1"
buildscript=`readlink -f "$1"`
buildscript_default=`readlink -f "$BUILDSCRIPTS_DIR/$1"`

# load teh fucking buildscript
if [ "$buildscript" -a -r "$buildscript" ]; then
	. "$buildscript"

elif [ "$buildscript_default" -a -r "$buildscript_default" ]; then
	buildscript="$buildscript_default"
	. "$buildscript_default"

else
	eecho "$buildscript_name: file not found"
	exit -1

fi

# check if $name is defined
if [ ! "$make" ]; then
	eecho "$buildscript: \$make not defined"
	exit -1
fi

# check if $pkgname is defined
if [ ! "$pkgname" ]; then
	eecho "$buildscript: \$pkgname not defined"
	exit -1
fi

# check if $srcdir is defined
if [ ! "$srcdir" ]; then
	eecho "$buildscript: \$srcdir not defined"
	exit -1
fi

# check if $objdir is defined
if [ ! "$objdir" ]; then
	eecho "$buildscript: \$objdir not defined"
	exit -1
fi

# check if $destdir_var is defined
#if [ ! "$destdir_var" ]; then
#	eecho "$buildscript: \$destdir_var not defined"
#	exit -1
#fi

# check if $destdir is defined
#if [ ! "$destdir" ]; then
#	eecho "$buildscript: \$destdir not defined"
#	exit -1
#fi

# check if $srcdir is a valid directory
if [ ! -d "$srcdir" ]; then
	if [ ! -d "$srcdir_default" ]; then
		eecho "$srcdir: not found or not a directory"
		exit -1
	fi

	srcdir="$srcdir_default"
fi

# clean up stuff if appropriate
if [ "$clean" ]; then
	if [ -d "$objdir" ]; then
		if [ "$objdir" == "$srcdir" ]; then
			eecho "Avoiding removal of $srcdir. Trying distclean"

			gnubuilder_make "$makeopts" "distclean" "$objdir" \
				"$overrides" &> /dev/null
		else
			rm -rf "$objdir"

		fi	
	fi

	if [ -d "$destdir" ]; then
		rm -rf "$destdir"
	fi
fi

#
# process package
#

if [ ! "$skip_configure" ]; then
	mkdir -p "$objdir"
		
	gnubuilder_configure "$configure_options" "$srcdir" "$objdir" \
		&> "$objdir/CONFIGURE_LOG"
	if [ "$?" -ne 0 ]; then
		eecho "$buildscript: configure failed"
		exit -1
	fi
fi

if [ ! "$skip_make" ]; then
	gnubuilder_make "$makeopts" "$targets" "$objdir" "$overrides" \
		&> "$objdir/MAKE_LOG"
	if [ "$?" -ne 0 ]; then
		eecho "$buildscript: make failed"
		exit -1
	fi
fi

if [ ! "$skip_package" -a "$destdir_var" -a "$destdir" ]; then
	gnubuilder_package "$makeopts" "$install_targets" \
		"$pkgname" "$objdir" "$destdir_var" "$skip_destdir_var_check" \
		"$destdir" "$overrides" &> "$objdir/PACKAGE_LOG"
	if [ "$?" -ne 0 ]; then
		eecho "$buildscript: package failed"
		exit -1
	fi
fi

exit 0


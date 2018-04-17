#!/bin/sh
#
# Makes a motherfucking rogi package
#

eecho()
{
	echo -e "$_0: $@." >&2
}

_0=`basename "$0"`

version_info="4.0"

help_info="\
Rogi package maker version $version_info.
Make motherfucking packages, you motherfucker.

Usage: $_0 [options] pkgname [rootdir]

Options:
  --			end of options (for packages beginning with '-')
  -V, --version		prints teh version string and exit
  -h, --help		pretty self explanatory

Unrecognized options and excess arguments will be silently ignored.

If rootdir argument is omited then current directory is assumed.

Exit status:
  0 if teh package was created successfuly
  nonzero otherwise

Rogi <rogi@linuxmail.org>"

#
# parse teh damn options
#

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

pkgname="$1"

rootdir='.'

if [ "$2" ]; then
	rootdir="$2"
fi

if [ ! -d "$rootdir" ]; then
	eecho "$rootdir: not found or not a directory"
	exit -1
fi

# change to root dir
oldpwd=`pwd`
cd "$rootdir"

if [ "$?" -ne 0 ]; then
	exit -1;
fi

# make teh motherfucking package
tar -cf "$oldpwd/$pkgname.tar" *

exit $?

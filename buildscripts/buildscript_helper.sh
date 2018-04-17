#!/bin/sh
#
# gnubuilder4 buildscript helper
#

if [ ! "$BUILDSCRIPTS_DIR" ]; then
	BUILDSCRIPTS_DIR=/rogix/buildscripts
fi

eecho()
{
	echo -e "$_0: $@." >&2
}

#
# teh body of teh script
#

_0=`basename "$0"`

version_info="4.0"

help_info="\
Rogi's GNU Crapware builder buildscript helper version $version_info.
Help creating motherfucking buildscripts, you motherfucker.

Usage: $_0 [options] infix packagename

Where infix is teh stuff between teh \"base_\" and \"_auto.sh\" in teh name of
teh base script you want to copy/link.

Options:
  --			end of options (for packages beginning with '-')
  -V, --version		prints teh version string and exit
  -c, --copy		copy base script
  -h, --help		pretty self explanatory
  -l, --link		don't copy base script, just link

Unrecognized options and excess arguments will be silently ignored.

This program behaves diferently depending on the name it is called:
  cpbuildscript		assume -c
  lnbuildscript		assume -l

The value of teh environment variable BUILDSCRIPTS_DIR is used as teh paths to
teh directory containing teh base buildscripts.

Exit status:
  0 if teh package was processed successfuly
  -1 otherwise

Rogi <rogi@linuxmail.org>"

#
# determine action based on teh name this script was called
#

#force=1

case $_0 in
# rogipkg_fake
cpbuildscript )
	action='copy';;

# rogipkg_install
lnbuildscript )
	action='link';;
esac

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

	# --list -l
	--list | -l )
		action='link'
		shift;;

	# --installed -I
	--copy | -c )
		action='copy'
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
if [ "$#" -lt 2 ]; then
	eecho "Insufficient arguments"
	exit -1
fi

infix="$1"
basescript="base_${infix}_auto.sh"
package="$2"

case "$action" in
copy )
	cp "$BUILDSCRIPTS_DIR/$basescript" "${package}_auto.sh" && \
	{
		ln -s "${package}_auto.sh" "${package}.sh"
		ln -s "${package}_auto.sh" "${package}_i686.sh"
		ln -s "${package}_auto.sh" "${package}_x86_64.sh"
	}
	break;;

link )
	ln -s "$BUILDSCRIPTS_DIR/base_$1_auto.sh" "${package}_auto.sh" && \
	{
		ln -s "${package}_auto.sh" "${package}.sh"
		ln -s "${package}_auto.sh" "${package}_i686.sh"
		ln -s "${package}_auto.sh" "${package}_x86_64.sh"
	}
	break;;

* )
	eecho 'Nothing to do'
	exit 0
esac

exit 0

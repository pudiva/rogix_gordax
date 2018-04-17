#!/bin/sh
#
# Manages motherfucking rogi packages
#

dir='/'
dbdir='/var/db/rogipkg'

if [ "$DESTDIR" ]; then
	dir="$DESTDIR"
fi

if [ "$DBDIR" ]; then
	dbdir="$DBDIR"
fi

eecho()
{
	echo -e "$_0: $@." >&2
}

pkg_name()
{
	case "$1" in
	*.tar.bz2)
		echo `basename $1 .tar.bz2`;;

	*.tar.gz)
		echo `basename $1 .tar.gz`;;

	*.tar)
		echo `basename $1 .tar`;;
	esac
}

# src, dest
backup()
(
	src=`readlink -f "$1"`
	dest=`readlink -f "$2"`

#	# only files that differ
#	LC_ALL=C diff -q -r "$src" "$dest" | grep 'differ' | while read line; do
#		srcf=`cut -d ' ' -f 2 <<< "$line"`
#		destf=`cut -d ' ' -f 4 <<< "$line"`
#
#		echo "$destf"
#
#		mv "$destf" "$destf~"
#		if [ "$?" -ne 0 ]; then
#			return -- -1
#		fi
#	done

	# a clever hack i would say
	find "$src" | sed -e "s#^$src/##" | while read srcf; do
		destf="$dest/$srcf"

		if [ -L "$destf" -o -e "$destf" -a ! -d "$destf" ]; then
			echo "$destf"

			mv "$destf" "$destf~"
			if [ "$?" -ne 0 ]; then
				return -- -1
			fi
		fi
	done
	
	return 0
)

# package, pkgname, dir, dbdir
rogipkg_fake()
(
	package=`readlink -f "$1"`
	pkgname="$2"
	dir=`readlink -f "$3"`
	dbdir=`readlink -f "$4"`

	tmplist=`mktemp` && \
	tar -tf "$package" > "$tmplist" && \
	mv "$tmplist" "$dbdir/$pkgname.list" && \

	r="$?"

	rm -f "$tmplist"

	return $r
)

# package, pkgname, dir, dbdir
rogipkg_install()
(
	package=`readlink -f "$1"`
	pkgname="$2"
	dir=`readlink -f "$3"`
	dbdir=`readlink -f "$4"`

	tmplist=`mktemp` && \
	tmpdir=`mktemp -d` && \
	tar -tf "$package" > "$tmplist" && \
	tar -C "$tmpdir" -xf "$package" && \
	backup "$tmpdir" "$dir" > "$pkgname.collisions" && \
	mv "$tmplist" "$dbdir/$pkgname.list" && \
	cp -a -r "$tmpdir"/* "$dir"

	r="$?"

	rm -f "$tmplist"
	rm -rf "$tmpdir"

	return $r
)

# pkgname, dir, dbdir
rogipkg_remove()
(
	pkgname="$1"
	dir=`readlink -f "$2"`
	dbdir=`readlink -f "$3"`

	list="$dbdir/$pkgname.list" 

	if [ ! -r "$list" ]; then
		return -- -1
	fi

	cat "$list" | while read line; do
		file="$dir/$line"
		if [ ! -d "$file" ]; then
			rm -f "$file"
		fi
	done

	rm "$list"

	return 0
)

# dbdir
rogipkg_list()
(
	dbdir=`readlink -f "$1"`

	ls -1 "$dbdir" | sed -e 's/\.list$//g'

	return 0
)

# pkgname, dbdir
rogipkg_installed()
(
	pkgname="$1"
	dbdir=`readlink -f "$2"`

	if [ -f "$dbdir/$pkgname.list" ]; then
		return 1
	fi

	return 0
)

_0=`basename "$0"`

version_info="4.0"

help_info="\
Rogi package manager version $version_info.
Manage motherfucking packages, you motherfucker.

Usage: $_0 [options] package1 [package2]...[packageN]

Options:
  --			end of options (for packages beginning with '-')
  -F, --fake		only add db entry without installing anything
  -I, --installed	returns 1 if all packages are installed or 0 otherwise
  -V, --version		prints teh version string and exit
  -f, --force		install packages even if already installed (do not
  			remove previous installation)
  -h, --help		pretty self explanatory
  -i, --install		install packages
  -l, --list		list all installed packages
  -r, --remove		remove packages

Unrecognized options and excess arguments will be silently ignored.

This program behaves diferently depending on the name it is called:
  rogipkg_fake		assume -F
  rogipkg_install	assume -i
  rogipkg_installed	assume -I
  rogipkg_list		assume -l
  rogipkg_remove	assume -r

The values of teh environment variables DESTDIR and DBDIR are used as paths to
teh instalation and database directories respectively.

Exit status:
  0 if teh package was created successfuly
  -1 otherwise

Rogi <rogi@linuxmail.org>"

#
# determine action based on teh name this script was called
#

#force=1

case $_0 in
# rogipkg_fake
rogipkg_fake )
	action='fake';;

# rogipkg_install
rogipkg_install )
	action='install';;

# rogipkg_remove
rogipkg_remove )
	action='remove';;

# rogipkg_list
rogipkg_list )
	action='list';;

# rogipkg_installed
rogipkg_installed )
	action='installed';;
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

	# I'm leaving this here since it doesnt seem to be harmful
	# --dir -d
	--dir | -d )
		# clever sed hack i would say
		dir=`sed -e 's/^\(--dir=\|-d\)//g' <<< "$arg"`
		shift;;

	# I'm leaving this here since it doesnt seem to be harmful
	# --dbdir -D
	--dbdir | -D )
		# clever sed hack i would say
		dbdir=`sed -e 's/^\(--dbdir=\|-D\)//g' <<< "$arg"`
		shift;;

	# --force -f
	--force | -f )
		force=1
		shift;;

	# --fake -F
	--fake | -F )
		action='fake'
		shift;;

	# --install -i
	--install | -i )
		action='install'
		shift;;

	# --remove -r
	--remove | -r )
		action='remove'
		shift;;

	# --list -l
	--list | -l )
		action='list'
		shift;;

	# --installed -I
	--installed | -I )
		action='installed'
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
if [ "$action" != 'list' -a "$#" -lt 1 ]; then
	eecho "Insufficient arguments"
	exit -1
fi


case "$action" in
fake )
	for package do
		pkgname=`pkg_name "$package"`
		if [ ! "$pkgname" ]; then
			eecho "$package: is not a valid package"
			exit -1
		fi

		rogipkg_installed "$pkgname" "$dbdir"
		if [ ! "$force" -a $? -ne 0 ]; then
			eecho "$package: is already installed"
			continue
		fi

		rogipkg_fake "$package" "$pkgname" "$dir" "$dbdir"
		r="$?"

		if [ "$r" -ne 0 ]; then
			eecho "$package: failed"
			exit -1
		fi
	done;;

install )
	for package do
		pkgname=`pkg_name "$package"`
		if [ ! "$pkgname" ]; then
			eecho "$package: is not a valid package"
			exit -1
		fi

		rogipkg_installed "$pkgname" "$dbdir"
		if [ ! "$force" -a $? -ne 0 ]; then
			eecho "$package: is already installed"
			continue
		fi

		rogipkg_install "$package" "$pkgname" "$dir" "$dbdir"
		r="$?"

		if [ "$r" -ne 0 ]; then
			eecho "$package: failed"
			exit -1
		fi
	done;;

remove )
	for pkgname do
		rogipkg_installed "$pkgname" "$dbdir"
		if [ "$?" -ne 1 ]; then
			eecho "$pkgname: not installed"
			continue
		fi

		rogipkg_remove "$pkgname" "$dir" "$dbdir"

		if [ "$?" -ne 0 ]; then
			eecho "$pkgname: failed"
			exit -1
		fi
	done;;

installed )
	for pkgname do
		rogipkg_installed "$pkgname" "$dbdir"

		if [ "$?" -ne 1 ]; then
			exit 0
		fi
	done

	exit 1;;

list )
	rogipkg_list "$dbdir";;
esac

exit 0

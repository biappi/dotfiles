#!/usr/bin/env bash

# Restores recorded permissions of everything under dotfiles.

# allow being chatty on what we do
VERBOSE=
[[ " $* " == *" -v "* ]] && VERBOSE=yes
vecho() {
	[[ -n ${VERBOSE} ]] && echo "$@"
}

# top dir
topdir=$(readlink -f ${BASH_SOURCE[0]}); topdir=${topdir%/bin/*}

[[ -e permissions.dotfiles ]] || exit 0

pushd ${topdir} > /dev/null || exit 1
while read line ; do
	# ignore comments and empty lines
	[[ -z ${line} || ${line} == "#"* ]] && continue
	bits=${line%% *}
	file=${line#* }
	[[ -e ${file} ]] || { vecho "${file} no longer(?) exists"; continue; }
	chmod ${bits} "${file}"
	vecho "set permissions for ${file} to ${bits}"
done < permissions.dotfiles
popd > /dev/null

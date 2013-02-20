#!/usr/bin/env bash

# link all files from the dotfiles repo in $HOME, iff non existant, or
# non-changed

# allow being chatty on what we do
VERBOSE=
[[ " $* " == *" -v "* ]] && VERBOSE=yes
vecho() {
	[[ -n ${VERBOSE} ]] && echo "$@"
}

# top dir of our dotfiles
topdir=$(readlink -f ${BASH_SOURCE[0]}); topdir=${topdir%/bin/*}/dotfiles
vecho "linking files from ${topdir}"
# better safe than sorry
[[ -d ${topdir} ]] || exit 1

# links files, never does directories, bails out if so
# dst should point into ${HOME}/...
maybe_link() {
	local src=$1
	local dst=$2

	[[ -n ${src} && -n ${dst} ]] || return 1
	[[ -d ${src} ]] && return 1

	if [[ -e ${dst} ]] ; then
		# don't deal with anything but files
		[[ -f ${dst} ]] || { vecho "${dst} is not a file"; return 0; }
		# and don't touch symlinked files, even if they don't point to us
		[[ -L ${dst} ]] && { vecho "leaving symlink ${dst} alone"; return 0; }
		# compare if this file is an unmodified .skel copy, else just
		# relink with what we're given
		if [[ ! -e /etc/skel/${dst#${HOME}} ]] \
			|| cmp -s "/etc/skel/${dst#${HOME}}" "${dst}" ;
		then
			vecho "leaving local (modified) file ${dst} alone"
			return 0
		fi
	fi

	# yay, we can finally link ;)
	mkdir -p "${dst%/*}" || return 1
	ln -sf "${src}" "${dst}"
	vecho "symlinked ${src} to ${dst}"
}

# we only symlink files, never directories, this is to make sure our
# files are only an overlay of what the user has in use
# skip .{git,svn,hg,bzr} dirs because it's no good to copy their contents
find "${topdir}" \
	\( -name .git -a -type d -prune \) -o \
	\( -name .svn -a -type d -prune \) -o \
	\( -name .hg -a -type d -prune \) -o \
	\( -name .bzr -a -type d -prune \) -o \
	-type f -print | \
while read f ; do
	maybe_link ${f} ${HOME}/${f#${topdir}/}
done
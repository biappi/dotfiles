#!/usr/bin/env bash

# Records permissions of everything under dotfiles and stores it, for
# recreation later since git doesn't store file permission bits.
# To avoid potentially storing lots of useless info, standard git
# permission modes (755/644) are not recorded.

# top dir
topdir=$(readlink -f ${BASH_SOURCE[0]}); topdir=${topdir%/bin/*}

pushd ${topdir} > /dev/null || exit 1
find dotfiles \
	\( -name .git -a -type d -prune \) -o \
	\( -name .svn -a -type d -prune \) -o \
	\( -name .hg -a -type d -prune \) -o \
	\( -name .bzr -a -type d -prune \) -o \
	-print | xargs stat -c "%a %n" | \
	grep -v '^\(755\|644\) ' > permissions.dotfiles
popd > /dev/null

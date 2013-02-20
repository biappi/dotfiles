#!/usr/bin/env bash

# Main entry point for the post pull/clone hook.
# Call scripts from here that you want to be executed after the
# .dotfiles repository has been setup/updated

VERBOSE=
[[ " $* " == *" -v "* ]] && VERBOSE=yes
FORCE=
[[ " $* " == *" -f "* ]] && FORCE=yes

bindir=$(readlink -f ${BASH_SOURCE[0]}); bindir=${bindir%/*}

# restore permissions not preserved by git
"${bindir}"/restore-permissions.sh ${VERBOSE+-v}

# put symlinks for dotfiles in place
"${bindir}"/link-files.sh ${VERBOSE+-v} ${FORCE+-f}

# setup git defaults
"${bindir}"/git-default-config.sh

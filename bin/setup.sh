#!/usr/bin/env bash

# Main entry point for the post pull/clone hook.
# Call scripts from here that you want to be executed after the
# .dotfiles repository has been setup/updated

VERBOSE=
[[ " $* " == *" -v "* ]] && VERBOSE=yes

bindir=$(readlink -f ${BASH_SOURCE[0]}); bindir=${bindir%/*}

# put symlinks for dotfiles in place
"${bindir}"/link-files.sh ${VERBOSE+-v}

# setup git defaults
"${bindir}"/git-default-config

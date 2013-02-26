#!/usr/bin/env bash

# Main entry point for the post pull/clone hook.
# Call scripts from here that you want to be executed after the
# .dotfiles repository has been setup/updated

# You can change this script in any way you want, including turning it
# into some other script, such as Perl, Python or Ruby.  Note that
# you're completely on your own here.

# This script is called by /usr/local/bin/dotfiles.pl after git pull or
# git clone with the following flags:
#  -v  verbose: generate informative (debug) messages
#  -f  force: override safety latches, mainly meant for the linkage of
#      files in your homedir

# Everything below is part of the standard setup recommended.  You are
# advised to tune the defaults through your office page instead of
# editing the script below.

VERBOSE=
[[ " $* " == *" -v "* ]] && VERBOSE=yes
FORCE=
[[ " $* " == *" -f "* ]] && FORCE=yes

bindir=$(readlink -f ${BASH_SOURCE[0]}); bindir=${bindir%/*}

# restore permissions not preserved by git
"${bindir}"/restore-permissions.sh ${VERBOSE:+-v}

# put symlinks for dotfiles in place
"${bindir}"/link-files.sh ${VERBOSE:+-v} ${FORCE:+-f}

# setup git defaults
"${bindir}"/git-default-config.sh

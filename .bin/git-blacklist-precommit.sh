#!/bin/bash

# set -x

YELLOW=$(tput setaf 136)
ORANGE=$(tput setaf 166)
RED=$(tput setaf 160)
MAGENTA=$(tput setaf 125)
VIOLET=$(tput setaf 61)
BLUE=$(tput setaf 33)
CYAN=$(tput setaf 37)
GREEN=$(tput setaf 64)
BOLD=$(tput bold)
RESET=$(tput sgr0)

[[ ! -z "$GIT_ALLOW_ALL" ]] && exit 0;

blacklist=(
  Dumper \
  STDERR \
  XXX \
  TODO \
  $GIT_BLACKLIST_WORDS
)

for word in ${blacklist[*]} ; do
  varname="GIT_ALLOW_${word}"
  [[ ! -z "${!varname}" ]] && continue

  pattern="$pattern -e ^\+.*${word}.*"
done

if git diff --cached | grep --color -C3 $pattern ; then

  echo ${MAGENTA}${BOLD}
  echo ' -'
  echo ' - well you are adding blacklisted words to the repo.  This is not good.'
  echo ' - you can override checks for e.g. Dumper with env vars like:'
  echo '   % GIT_ALLOW_Dumper=1 git commit'
  echo ' -'
  echo ${RESET}

  exit 1

fi

exit 0


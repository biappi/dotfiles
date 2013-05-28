# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source aliases
if [ -f ~/.alias ]; then
    . ~/.alias
fi

# Setup the proxy
export http_proxy=http://webproxy:3128/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

# User specific aliases and functions
export PATH=~/bin:$PATH:/sbin:/usr/sbin

# - Solarized Theme
 
tput sgr0
BASE03=$(tput setaf 234)
BASE02=$(tput setaf 235)
BASE01=$(tput setaf 240)
BASE00=$(tput setaf 241)
BASE0=$(tput setaf 244)
BASE1=$(tput setaf 245)
BASE2=$(tput setaf 254)
BASE3=$(tput setaf 230)
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
 
# - Man page coloring
 
man() {
	env \
		LESS_TERMCAP_mb=$YELLOW \
		LESS_TERMCAP_md=$MAGENTA \
		LESS_TERMCAP_me=$RESET \
		LESS_TERMCAP_se=$RESET \
		LESS_TERMCAP_so=$(tput setab 239)$BOLD$ORANGE \
		LESS_TERMCAP_ue=$RESET \
		LESS_TERMCAP_us=$CYAN \
			man "$@"
}
 
# - Prompt
 
. ~/.dotfiles/bin/git-prompt.sh
. ~/.dotfiles/bin/git-autocompletion.sh
 
export PS1='\[$BLUE\]\u\[$BASE0\]@\[$BLUE\]\h \[$CYAN\]\W\[$BASE0\]$(__git_ps1 " \[$YELLOW\]%s")\[$BASE0\]\$ \[$RESET\]'
 
# - Environment
 
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxegedabagaced
export EDITOR=vim
export VISUAL=vim
export LESS="R"

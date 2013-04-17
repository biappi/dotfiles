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

if [ $(id -u) -eq 0 ]
then
  PS1="[\u@\h \w]# "
else
  PS1="[\u@\h \w]\$ "
fi

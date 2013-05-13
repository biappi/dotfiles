#!/bin/bash

if [ "$(ps ax | grep ssh-to-tavor.tunnel-start.sh| grep -vc grep)" -lt 1 ]; then
 sudo -u willy /Users/willy/.bin/ssh-to-tavor.tunnel-start.sh &
fi


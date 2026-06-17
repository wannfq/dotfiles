#!/bin/sh

session=$(sesh list -t | fzf --tmux 80%,80% --prompt '  ' \
    --border-label ' Tmux sessions ' \
    --header 'ctrl-x: Kill session' \
    --bind 'ctrl-x:execute(tmux kill-session -t {2..})+change-prompt(  )+reload(sesh list -t)' \
    --preview 'sesh preview {}')

zle reset-prompt >/dev/null 2>&1 || true
[ -z "$session" ] && exit 0
sesh connect "$session"

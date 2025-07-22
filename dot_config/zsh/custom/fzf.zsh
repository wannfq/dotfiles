#
# fzf customisation
#

# fzf default command for file searching
export FZF_DEFAULT_COMMAND='rg --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!target/*" --files'

# Use \\ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='\\'

# Make fzf --tmux by default
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p80%,60%'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  bind='ctrl-/:change-preview-window(down|hidden|)'

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200' --bind $bind   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}" --bind $bind         "$@" ;;
    ssh)          fzf --preview 'dig {}' --bind $bind                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' --bind $bind "$@" ;;
  esac
}

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --preview 'bat -n --color=always {}'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --preview 'tree -C {} | head -200'"

# Load alias finder
zstyle ':zim:plugins:alias-finder' include-longer yes autoload yes

# fzf tab-completions configs
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --color=always --icons $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always $realpath'

# History
HISTFILE=$ZSH_CONFIG/.zhistory
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Autocorrection
setopt CORRECT

# Shell
setopt AUTOCD

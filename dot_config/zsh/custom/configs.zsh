# Load alias finder
zstyle ':zim:plugins:alias-finder' include-longer yes autoload yes

# fzf tab-completions configs
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always $realpath'

#
# Aliases
#

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# c into clear
alias c=clear

# lsd into ls
if [ -x "$(command -v lsd)" ]; then
    alias ls="lsd"
    alias la="lsd -a"
    alias ll="lsd -lGgF" # list in grid
    alias lla="lsd -la" # list all
    alias lt="lsd --tree --depth 2" # list tree
fi

# neovim into vim
alias vim=nvim
alias v=nvim

# tmux into t
alias t=tmux

# fzf alias
alias f=fzf

# chezmoi to cm
alias cm=chezmoi

# yazi into e
alias e=yazi
alias y=yazi

# kubectl to k
alias k=kubectl
alias kctx=kubectl ctx
alias kns=kubectl ns

# minikube alias
alias mk=minikube
alias mkk=minikube kubectl --

# Opentofu to tf
alias tf=tofu

# git alias
alias g=git

# Lazygit alias
alias lg=lazygit
alias gg=lazygit

# Lazydocker aliase
alias ld=lazydocker

# Startup profiler
alias prof="time ZSH_DEBUGRC=1 zsh -i -c exit"

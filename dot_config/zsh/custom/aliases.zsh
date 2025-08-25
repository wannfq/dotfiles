#
# Aliases
#

# alias finder
alias af=alias-finder

# eza into ls
if [ -x "$(command -v eza)" ]; then
    alias ls="eza --icons --group-directories-first"
    alias la="eza -a --icons --group-directories-first"
    alias ll="eza --icons --long --git --group-directories-first" # long in grid
    alias lla="eza -a --icons --long --git --group-directories-first" # long all in grid
    alias lt="eza --tree --icons --level=2" # list tree
    alias lta="eza -a --tree --icons --level=2" # list tree all
    alias lx="eza -a --icons --long --group-directories-first --git --extended"
fi

# neovim into vim
alias vim=nvim

# chezmoi to cm
alias cm=chezmoi

# yazi into y
alias y=yazi

# kubectl to k
alias k=kubectl
alias kctx=kubectl ctx
alias kns=kubectl ns

# minikube alias
alias mk=minikube
alias mkk=minikube kubectl --

# Opentofu to tf
if [ -x "$(command -v tofu)" ]; then
    alias tf=tofu
fi

# Lazygit alias
alias lg=lazygit

# Lazydocker aliase
alias ld=lazydocker

# Startup profiler
alias prof="time ZSH_DEBUGRC=1 zsh -i -c exit"

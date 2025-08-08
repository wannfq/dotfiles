#
# Sources
#

# Loads powerlevel10k theme. For ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source $HOME/.p10k.zsh

# Loads fzf
source =(fzf --zsh)

# Load orbstack
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

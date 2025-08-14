# Load p10k instant prompt. Should be at the of this zshrc file
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load p10k configuration
# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f ${ZSH_CONFIG}/.p10k.zsh ]] || source ${ZSH_CONFIG}/.p10k.zsh

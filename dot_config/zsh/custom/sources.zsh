#
# Sources
#

# Load zsh-defer
source ${ZIM_HOME}/modules/zsh-defer/zsh-defer.plugin.zsh

# Init zoxide
zsh-defer _evalcache zoxide init zsh --cmd cd

# Activate mise
zsh-defer _evalcache mise activate zsh

# Load homebrew (macos)
if [ -x /opt/homebrew/bin/brew ]; then
    zsh-defer _evalcache "$(/opt/homebrew/bin/brew shellenv)"
fi 

# Load orbstack (macos)
if [ -f ${HOME}/.orbstack/shell/init.zsh ]; then
    zsh-defer source ${HOME}/.orbstack/shell/init.zsh
fi

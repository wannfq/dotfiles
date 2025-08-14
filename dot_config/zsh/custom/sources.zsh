#
# Sources
#

# Load zsh-defer
source ${ZIM_HOME}/modules/zsh-defer/zsh-defer.plugin.zsh

# Init zoxide
zsh-defer _evalcache zoxide init zsh --cmd cd

# Activate mise
zsh-defer _evalcache mise activate zsh

# Load orbstack
zsh-defer source ${HOME}/.orbstack/shell/init.zsh

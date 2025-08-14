# zsh files

## Dependencies

- brew
- git
- zim
- nerd fonts
- fzf
- lsd
- zoxide
- mise

### Optional Dependencies

- yazi
- lazygit
- delta
- lazydocker
- docker
- orbstack
- awscli
- kubectl

## Setup

Add these to `~/.zshenv` file. Create it if doesn't exists.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
```

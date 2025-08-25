# zsh files

## Dependencies

- git

- zim

    ```sh
    wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    ```

### Optional Dependencies

- nerd fonts
- mise
- eza
- fzf
- ripgrep
- fd
- zoxide
- fastfetch
- yazi
- lazygit
- delta
- docker
- lazydocker
- orbstack (MacOS)
- awscli
- kubectl
- tmux
- sesh

## Setup

Add these to `~/.zshenv` file. Create it if doesn't exists.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
```

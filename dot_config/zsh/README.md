# zsh files

## Dependencies

- git

- zim (a fast zsh config framework)

    This dotfiles is preconfigured to automatically install zim framework if not found.

    For manual installation, run:

    ```sh
    wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    ```

    *Note: Once the zim installation is done,
    I highly recommend you to delete the **generated** codes in `.zimrc` and `.zshrc` files.*

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
- opencode

## Setup

Do this if you want to configure the `.zshrc` in the `~/.config/zsh` directorya.

Add these to `~/.zshenv` file. Create it if doesn't exists.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
```

# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Supported OS

- macOS (Apple Silicon & Intel)
- Arch Linux

## Required Dependencies

Only `curl` and `git` are required to bootstrap. The install script will handle the rest.

**macOS**: Xcode Command Line Tools (for git)
```sh
xcode-select --install
```

**Arch Linux**: Base packages
```sh
sudo pacman -S git curl
```

## Quickstart

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply wannfq
```

The install script will automatically:
- Install the appropriate package manager (Homebrew on macOS, yay on Arch)
- Install all tools and dependencies
- Configure plugin managers (zimfw, TPM, yazi)

## Repository Structure

| File/Directory | Purpose |
|----------------|---------|
| `.zshenv` | Sets XDG base directories and `ZDOTDIR` to keep zsh config in `~/.config/zsh` |
| `dot_config/` | Application configurations managed by chezmoi |
| `run_once_before_install.sh.tmpl` | One-time bootstrap script for installing packages |
| `private_dot_gitconfig` | Git configuration (includes delta pager and 1Password SSH signing) |

## Installed Tools

### CLI Tools
| Tool | Description |
|------|-------------|
| neovim | Modern Vim-based editor |
| tmux | Terminal multiplexer |
| zsh | Z shell |
| yazi | Terminal file manager |
| fastfetch | System information tool |
| eza | Modern `ls` replacement |
| bat | Modern `cat` with syntax highlighting |
| fzf | Fuzzy finder |
| zoxide | Smarter `cd` command |
| lazygit | Git TUI |
| lazydocker | Docker TUI |
| ripgrep | Fast grep alternative |
| jq | JSON processor |
| yq | YAML processor |
| fd | Modern `find` replacement |
| fx | Terminal JSON viewer |
| curlie | Modern curl wrapper |
| git-delta | Better git diff |
| btop | Resource monitor |
| tealdeer | Fast tldr client |

### Terminal Emulators
| Tool | Description |
|------|-------------|
| ghostty | GPU-accelerated terminal |
| kitty | GPU-based terminal emulator |

### Dev Tools
| Tool | Description |
|------|-------------|
| k9s | Kubernetes TUI |
| kubectl | Kubernetes CLI |
| krew | kubectl plugin manager |
| docker | Container runtime |
| gh | GitHub CLI |
| mise | Runtime version manager |
| opencode | AI coding agent for terminal |

### Fonts (Nerd Fonts)
- Meslo Nerd Font
- Monaspace Nerd Font
- JetBrains Mono Nerd Font

### Plugin Managers
| Tool | Description |
|------|-------------|
| zimfw | Zsh plugin manager |
| TPM | Tmux Plugin Manager |

## Configured Applications

Configuration files are provided for:

- **zsh** - Modular shell configuration using zimfw with:
  - [powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
  - [fzf-tab](https://github.com/Aloxaf/fzf-tab) for fuzzy tab completion
  - [zsh-defer](https://github.com/romkatv/zsh-defer) and [evalcache](https://github.com/mroth/evalcache) for fast startup
  - [zoxide](https://github.com/ajeetdsouza/zoxide) integration (`cd` replacement)
  - [mise](https://mise.jdx.dev/) activation
  - Custom aliases, functions, and PATH configuration
- **neovim** - Full IDE setup with LSP, completion, and plugins via lazy.nvim
- **tmux** - Terminal multiplexer with catppuccin theme and TPM
- **kitty** - Terminal emulator configuration
- **ghostty** - Terminal emulator with custom shaders
- **yazi** - File manager with plugins (smart-enter, full-border, git, lazygit, rich-preview) and themes
- **k9s** - Kubernetes TUI with plugins and skins
- **fastfetch** - System info display
- **opencode** - AI coding agent configuration
- **git** - Delta pager, 1Password SSH signing, and custom delta themes

## Optional Tools

The following tools are referenced in aliases and functions but are **not** auto-installed by the bootstrap script (install manually if needed):

| Tool | Description |
|------|-------------|
| go | Go programming language (used in PATH config) |
| minikube | Local Kubernetes cluster (`mk` alias) |
| tofu / opentofu | OpenTofu IaC tool (`tf` alias) |
| bun / pnpm / yarn / deno | JS package managers (used by `pls` function) |

## Post-Installation Notes

- **Neovim**: Plugins auto-install on first launch via lazy.nvim
- **Zsh**: Zim modules auto-install on first shell startup
- **Tmux**: Plugins installed automatically by the setup script
- **Yazi**: Plugins are managed via `package.toml` and installed with `ya pkg install`
- Restart your terminal after installation for all changes to take effect

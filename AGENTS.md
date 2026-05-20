# AGENTS.md

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). Source directory is `~/.local/share/chezmoi` (this repo); targets are files in the home directory `~`.

## Chezmoi Conventions

- `dot_foo` → `~/.foo`
- `private_foo` → `~/.foo` with `0600` permissions
- `foo.tmpl` → processed as a Go template before being written
- `run_once_before_foo.sh.tmpl` → executed once on first `chezmoi apply`

## Key Paths

| Source | Target | Notes |
|--------|--------|-------|
| `dot_config/opencode/opencode.jsonc` | `~/.config/opencode/opencode.jsonc` | MCP servers, permissions, plugins |
| `dot_config/nvim/` | `~/.config/nvim/` | lazy.nvim; `lazy-lock.json` is ignored |
| `dot_config/zsh/` | `~/.config/zsh/` | zimfw; `.zim/`, `.zcompdump*`, `.zsh_history` are ignored |
| `dot_config/tmux/` | `~/.config/tmux/` | TPM; `plugins/` is ignored |
| `dot_config/yazi/` | `~/.config/yazi/` | Plugins installed via `ya pkg install`; `plugins/` and `flavors/` are ignored |
| `dot_zshenv` | `~/.zshenv` | Sets `XDG_*` dirs and `ZDOTDIR` |
| `private_dot_gitconfig` | `~/.gitconfig` | Delta pager, 1Password SSH signing |
| `run_once_before_install.sh.tmpl` | — | Bootstrap: installs Homebrew/yay, CLI tools, fonts, mise, opencode, zimfw, TPM, yazi plugins |

## Editing & Verifying

This repo has **no build, test, or lint steps**. Validate changes with chezmoi directly:

```sh
# Preview what would change
chezmoi diff

# Apply changes to the live dotfiles
chezmoi apply

# Edit a target file via chezmoi (handles re-add automatically)
chezmoi edit ~/.config/foo
```

> **Warning:** If chezmoi prompts about overwriting local changes, stop and investigate. Do **not** run `chezmoi apply --force` or pass `--force` blindly — it will silently overwrite local target files and you may lose data.
```

## Templates

`run_once_before_install.sh.tmpl` contains OS-specific logic via chezmoi templates (`{{ if eq .chezmoi.os "darwin" }}` / `arch`). It supports **macOS** and **Arch Linux** only. When editing templates, run `chezmoi apply` (or `chezmoi execute-template < file.tmpl`) to verify template syntax.

## Ignored Files

`.chezmoiignore` excludes generated/plugin state (e.g., `lazy-lock.json`, zim modules, tmux plugins, yazi plugins/flavors, opencode `logs/` and `node_modules/`). Do not commit these.

## OpenCode Configuration

The `opencode.jsonc` in this repo is the live config for the OpenCode agent. It defines MCP servers (GitHub, Datadog, PagerDuty, Glean, etc.) and sets most external tools to `ask` permission. Environment variables expected: `GITHUB_TOKEN_SEEK`, `DD_API_KEY`, `DD_APP_KEY`, `PD_API_KEY`.

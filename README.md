# Dotfiles

Personal configuration files for my Linux development environment, managed with
[dotbot](https://github.com/anishathalye/dotbot). Cloning the repository and
running a single command symlinks everything into place.

Tuned for **Ubuntu 24.04** with the **i3** window manager.

## What's inside

| Tool | Config | Notes |
| --- | --- | --- |
| **zsh** | `zshrc`, `aliases`, `functions` | Interactive shell |
| **tmux** | `tmux.conf` | Dracula theme |
| **Neovim** | `nvim/` | Lua config, plugins via [lazy.nvim](https://github.com/folke/lazy.nvim) |
| **Vim** | `vimrc` | Minimal fallback config |
| **Alacritty** | `alacritty.toml` | GPU terminal, GitHub-dark colors |
| **i3 / i3blocks** | `i3/` | Window manager and status bar |
| **Git** | `gitconfig` | User and aliases |
| **IdeaVim** | `ideavimrc` | JetBrains IDE Vim bindings |
| **keyd** | `keyd/default.conf` | System-wide key remapping (see below) |

## Requirements

- `git`
- A POSIX shell (the bootstrap script uses `bash`)
- [keyd](https://github.com/rvaiya/keyd) — only if you want the key remapping;
  not packaged for Ubuntu 24.04, so build it from source first

## Installation

```sh
git clone --recurse-submodules https://github.com/buivietnhat/dotfiles.git
cd dotfiles
./install
```

`./install` is idempotent — rerun it any time after pulling changes. It will:

- symlink each dotfile to its expected location (`~/.zshrc`, `~/.config/nvim`, …);
- create `~/.vim/undo-history`;
- install the keyd config to `/etc/keyd/` and enable the service (prompts for
  `sudo`).

## Key remapping (keyd)

Key remapping is handled by [keyd](https://github.com/rvaiya/keyd), which
operates at the evdev layer so the mappings apply everywhere (terminals,
browsers, GUI apps) and survive across display servers. Current bindings:

| Keys | Action |
| --- | --- |
| `Caps Lock` | `Escape` |
| `Ctrl` + `Caps Lock` | real `Caps Lock` toggle |
| `Alt` + `Left` / `Right` | `Home` / `End` |
| `Alt` + `Shift` + `Left` / `Right` | select to line start / end |

The config lives in `keyd/default.conf` and is deployed to
`/etc/keyd/default.conf` by `./install`. After editing it, reload with:

```sh
sudo keyd reload
```

## Structure

```
dotfiles/
├── install            # bootstrap script (invokes dotbot)
├── install.conf.yaml  # dotbot config: links, hooks
├── dotbot/            # dotbot (git submodule)
├── nvim/              # Neovim Lua configuration
├── i3/                # i3 + i3blocks
├── keyd/              # keyd remapping config
└── *                  # individual dotfiles (zshrc, tmux.conf, …)
```

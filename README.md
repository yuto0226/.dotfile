# Yuto's Dotfiles

Dotfiles for Zsh, Tmux, GDB, Fastfetch, Neovim, Kitty, and Starship — managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

Clone the repository and run the install script:

```zsh
git clone https://github.com/yuto0226/.dotfile.git ~/.dotfile
cd ~/.dotfile
./install.sh          # install all tools
./install.sh zsh      # or install specific tool(s)
```

Supported targets: `zsh`, `tmux`, `gdb`, `fastfetch`

## Manual Setup

Install `stow`, then symlink any package into `$HOME`:

```zsh
sudo apt install -y stow
cd ~/.dotfile
stow zsh              # replace with any package directory
```

## Packages

### Zsh

- **Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Plugins:** [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use), git, tmux, docker, golang, uv, rust
- **Extras:** fzf integration, modular config under `~/.zsh/`

The install script sets Zsh as the default shell automatically.

### Tmux

- **Prefix:** `Ctrl + a`
- **Plugins (via [TPM](https://github.com/tmux-plugins/tpm)):**
  - [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu) — CPU/memory status
  - [tmux-yank](https://github.com/tmux-plugins/tmux-yank) — clipboard integration
  - [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux) — theme
  - [aw-watcher-tmux](https://github.com/akohlbecker/aw-watcher-tmux) — ActivityWatch integration

Key bindings:

| Key           | Action                     |
| ------------- | -------------------------- |
| `prefix + \|` | Split horizontally         |
| `prefix + -`  | Split vertically           |
| `prefix + r`  | Reload config              |
| `h/j/k/l`     | Navigate panes (Vim-aware) |

### GDB

Multiple GDB profiles selectable via wrapper scripts:

| Command          | Profile                                                     |
| ---------------- | ----------------------------------------------------------- |
| `gdb`            | Standard GDB                                                |
| `gdb-dashboard`  | [GDB Dashboard](https://github.com/cyrus-and/gdb-dashboard) |
| `gdb-peda`       | [PEDA](https://github.com/longld/peda)                      |
| `gdb-peda-intel` | PEDA (Intel syntax)                                         |
| `gdb-peda-arm`   | PEDA (ARM)                                                  |
| `gdb-gef`        | [GEF](https://github.com/hugsy/gef)                         |
| `gdb-pwndbg`     | [Pwndbg](https://github.com/pwndbg/pwndbg)                  |

### Fastfetch

System info display. Config at `.config/fastfetch/config.jsonc`.

```zsh
fastfetch   # or use the alias: fetch
```

### Neovim

Based on [LazyVim](https://www.lazyvim.org/). Config at `nvim/.config/nvim/`.

```zsh
nvim   # or use the alias: nv
```

### Kitty

Terminal emulator config at `kitty/.config/kitty/kitty.conf`.

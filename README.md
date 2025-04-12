# Yuto's Dotfiles

This repository contains configuration files for various tools, including Zsh, Tmux, GDB, Fastfetch, and NVim.

## How to Use

First, install `stow` for dotfile management:

```zsh
sudo apt install -y stow
```

Next, clone this repository and use `stow` to manage the desired configuration. For example, to use the Zsh configuration:

```zsh
git clone https://github.com/yuto0226/.dotfile.git && cd .dotfile
stow zsh # Replace 'zsh' with any package in this repository
```

## Zsh

To use the provided Zsh configuration, install `zsh` and `oh-my-zsh`:

```zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then, use `stow` to apply the configuration:

```zsh
stow zsh
```

Finally, set Zsh as the default shell:

```zsh
chsh -s $(which zsh)
```

Restart your terminal to apply the changes.

### Zsh Plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

## Tmux

To use the provided Tmux configuration, install `tmux`:

```zsh
sudo apt install -y tmux
```

Apply the configuration using `stow`:

```zsh
stow tmux
```

Start Tmux:

```zsh
tmux
```

Install [TPM](https://github.com/tmux-plugins/tpm) for plugin management.

The prefix key is set to `Ctrl + a`. You can split windows using `prefix + |` and `prefix + -`.

## GDB

This configuration includes various GDB plugins:

- [GDB Dashboard](https://github.com/cyrus-and/gdb-dashboard)
- [PEDA](https://github.com/longld/peda)
- [GEF](https://github.com/hugsy/gef)
- [Pwndbg](https://github.com/pwndbg/pwndbg)

To use them, clone the repository and run the corresponding GDB command. For example:

```zsh
gdb             # Standard GDB
gdb-dashboard   # GDB with GDB Dashboard
gdb-peda        # GDB with PEDA
gdb-gef         # GDB with GEF
gdb-pwndbg      # GDB with Pwndbg
```

## Fastfetch

Fastfetch is a CLI tool for displaying system information. To use the provided configuration, install `fastfetch`:

```zsh
sudo apt install -y fastfetch
```

Apply the configuration using `stow`:

```zsh
stow fastfetch
```

Run Fastfetch:

```zsh
fastfetch
```

## NVim

This NVim configuration is based on LazyVim. To use it, first add the unstable PPA and install `nvim`:

```zsh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim
```

Apply the configuration using `stow`:

```zsh
stow nvim
```

Open NVim:

```zsh
nvim
```

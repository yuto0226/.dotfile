# Yuto's Dotfiles

This repository contains configuration files for various tools including zsh, tmux, gdb, fastfetch, and nvim.

## How to Use

First, install `stow` for dotfile management by running the following command:

```zsh
sudo apt install -y stow
```

Next, clone this repository and use `stow` to manage the desired package. For example, to use the zsh configuration, run:

```zsh
git clone https://github.com/yuto0226/.dotfile.git && cd .dotfile
stow zsh # Replace 'zsh' with any package in this repo
```

## Zsh

To use the provided Zsh configuration, first install `zsh` and `oh-my-zsh`:

```zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then, use `stow` to manage the configuration:

```zsh
stow zsh
```

Finally, change the default shell to `zsh`:

```zsh
chsh -s $(which zsh)
```

Restart your terminal to apply the changes.

## Tmux

To use the provided Tmux configuration, first install `tmux`:

```zsh
sudo apt install -y tmux
```

Then, use `stow` to manage the configuration:

```zsh
stow tmux
```

Finally, start `tmux`:

```zsh
tmux
```

## GDB

This configuration includes various GDB plugins, such as:

- [gdb-dashboard](https://github.com/cyrus-and/gdb-dashboard)
- [PEDA](https://github.com/longld/peda)
- [GEF](https://github.com/hugsy/gef)
- [Pwndbg](https://github.com/pwndbg/pwndbg)

To use them, simply clone the git repository and type the corresponding `gdb-plugin` command. For example, you can use the following commands to start GDB with different plugins:

```zsh
gdb             # Normal GDB
gdb-dashboard   # with gdb-dashboard
gdb-peda        # with PEDA
gdb-gef         # with GEF
gdb-pwndbg      # with Pwndbg
```

## Fastfetch

Fastfetch is a CLI tool to display system information. To use the provided configuration, first install `fastfetch`:

```zsh
sudo apt install -y fastfetch
```

Then, use `stow` to manage the configuration:

```zsh
stow fastfetch
```

Finally, run `fastfetch`:

```zsh
fastfetch
```

## NVim

This NVim configuration is based on modifying LazyVim. To use the provided Neovim configuration, first add the unstable PPA and install `nvim`:

```zsh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim
```

Then, use `stow` to manage the configuration:

```zsh
stow nvim
```

Finally, open `nvim`:

```zsh
nvim
```

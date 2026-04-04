#!/usr/bin/env bash
# Verification script — runs inside the container after install.sh

PASS=0
FAIL=0

check() {
  local desc=$1 cmd=$2
  if eval "$cmd" &>/dev/null 2>&1; then
    echo "[+] $desc"
    ((PASS++))
  else
    echo "[-] FAIL: $desc"
    ((FAIL++))
  fi
}

# Like check but shows output on failure for easier debugging
check_v() {
  local desc=$1 cmd=$2
  local out
  if out=$(eval "$cmd" 2>&1); then
    echo "[+] $desc"
    ((PASS++))
  else
    echo "[-] FAIL: $desc"
    echo "    $out"
    ((FAIL++))
  fi
}

echo ""
echo "=== zsh ==="
check   "zsh binary"                    "command -v zsh"
check_v "zsh --version runs"            "zsh --version"
check   "oh-my-zsh installed"           "[[ -d \$HOME/.oh-my-zsh ]]"
check   "plugin: zsh-autosuggestions"   "[[ -d \$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]"
check   "plugin: zsh-syntax-highlight"  "[[ -d \$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]"
check   "plugin: you-should-use"        "[[ -d \$HOME/.oh-my-zsh/custom/plugins/you-should-use ]]"
check   "theme: powerlevel10k"          "[[ -d \$HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]"
check   "fzf binary"                    "command -v fzf"
check_v "fzf --version runs"            "fzf --version"
check   "stow: ~/.zshrc symlink"        "[[ -L \$HOME/.zshrc ]]"
check   "stow: ~/.zsh dir symlink"      "[[ -L \$HOME/.zsh ]]"
check   "stow: ~/.p10k.zsh symlink"     "[[ -L \$HOME/.p10k.zsh ]]"
check_v "~/.zshrc syntax valid"         "zsh -n \$HOME/.zshrc"

echo ""
echo "=== tmux ==="
check   "tmux binary"                   "command -v tmux"
check_v "tmux -V runs"                  "tmux -V"
check   "TPM cloned"                    "[[ -d \$HOME/.tmux/plugins/tpm ]]"
check   "stow: ~/.tmux.conf symlink"    "[[ -L \$HOME/.tmux.conf ]]"
check_v "tmux starts a detached session" \
        "tmux new-session -d -s verify_test && tmux kill-session -t verify_test"

echo ""
echo "=== fastfetch ==="
check   "fastfetch binary"              "command -v fastfetch"
check_v "fastfetch --version runs"      "fastfetch --version"
check   "stow: ~/.config/fastfetch"     "[[ -e \$HOME/.config/fastfetch ]]"

echo ""
echo "=== gdb ==="
check   "gdb binary"                    "command -v gdb"
check_v "gdb --version runs"            "gdb --version"
check   "pwndbg cloned"                 "[[ -d \$HOME/src/pwndbg ]]"
check   "peda cloned"                   "[[ -d \$HOME/src/peda ]]"
check   "gef downloaded"                "[[ -f \$HOME/src/gef/gef.py ]]"
check   "gdb-dashboard cloned"          "[[ -d \$HOME/src/gdb-dashboard ]]"
check   "stow: ~/.gdbinit symlink"      "[[ -L \$HOME/.gdbinit ]]"
check   "stow: ~/.local/bin/gdb-*"      "ls \$HOME/.local/bin/gdb-* 2>/dev/null | grep -q ."
check   "pwndbg setup completed"        "[[ -f \$HOME/src/pwndbg/.setup_done ]]"
check_v "gdb -batch exits cleanly"      "gdb -batch -ex quit"

echo ""
echo "────────────────────────────────────"
echo "Results: ${PASS} passed, ${FAIL} failed"
echo ""

[[ $FAIL -eq 0 ]]

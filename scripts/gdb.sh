#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

info "=== gdb ==="

install_pkg gdb

SRC="$HOME/src"
mkdir -p "$SRC"

# pwndbg
if [[ -d "$SRC/pwndbg" ]]; then
  ok "pwndbg already installed"
else
  info "Installing pwndbg..."
  clone_if_missing "https://github.com/pwndbg/pwndbg" "$SRC/pwndbg"
  (cd "$SRC/pwndbg" && ./setup.sh)
fi

# peda
clone_if_missing "https://github.com/longld/peda" "$SRC/peda"

# gef
GEF_DIR="$SRC/gef"
if [[ ! -f "$GEF_DIR/gef.py" ]]; then
  mkdir -p "$GEF_DIR"
  info "Downloading gef..."
  curl -fsSL "https://raw.githubusercontent.com/hugsy/gef/main/gef.py" \
    -o "$GEF_DIR/gef.py"
else
  ok "gef already installed"
fi

# gdb-dashboard
clone_if_missing "https://github.com/cyrus-and/gdb-dashboard" "$SRC/gdb-dashboard"

stow_pkg gdb

info "Verifying..."
gdb --version | head -1
ok "gdb done"

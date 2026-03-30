#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

info "=== tmux ==="

install_pkg tmux

# TPM
TPM_DIR="$HOME/.tmux/plugins/tpm"
clone_if_missing "https://github.com/tmux-plugins/tpm" "$TPM_DIR"

stow_pkg tmux

# Install TPM plugins non-interactively (requires tmux server to be running
# or we can just install them directly without a server)
info "Installing TPM plugins..."
"$TPM_DIR/bin/install_plugins"

info "Verifying..."
tmux -V
ok "tmux done"

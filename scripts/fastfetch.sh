#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

info "=== fastfetch ==="

install_fastfetch() {
  case "$OS" in
    arch)
      install_pkg fastfetch
      ;;
    ubuntu|debian)
      if ! command -v fastfetch &>/dev/null; then
        info "Adding fastfetch PPA..."
        sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
        sudo apt-get update
        sudo apt-get install -y fastfetch
      else
        ok "fastfetch already installed"
      fi
      ;;
  esac
}

install_fastfetch
stow_pkg fastfetch

info "Verifying..."
fastfetch --version
ok "fastfetch done"

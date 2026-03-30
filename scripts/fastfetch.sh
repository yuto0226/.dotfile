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
      # Always ensure PPA is present so future apt upgrades come from it
      sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
      sudo apt-get update -qq
      install_pkg fastfetch
      ;;
  esac
}

install_fastfetch
stow_pkg fastfetch

info "Verifying..."
fastfetch --version
ok "fastfetch done"

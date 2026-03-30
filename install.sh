#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/scripts/lib.sh"

usage() {
  echo "Usage: $0 [zsh|tmux|gdb|fastfetch|all]"
  echo "  No args → installs everything (same as 'all')"
}

run_installer() {
  local tool=$1
  bash "$SCRIPT_DIR/scripts/${tool}.sh"
}

# Ensure stow is available first
install_pkg stow

TOOLS=(zsh tmux gdb fastfetch)

if [[ $# -eq 0 || "${1:-}" == "all" ]]; then
  for tool in "${TOOLS[@]}"; do
    run_installer "$tool"
  done
elif [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  usage
else
  for arg in "$@"; do
    if printf '%s\n' "${TOOLS[@]}" | grep -qx "$arg"; then
      run_installer "$arg"
    else
      error "Unknown tool: $arg. Valid options: ${TOOLS[*]}"
    fi
  done
fi

info ""
info "All done! Open a new shell or run: exec zsh"

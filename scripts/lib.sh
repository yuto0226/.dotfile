#!/usr/bin/env bash
set -euo pipefail

# ── Colours ───────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RESET='\033[0m'
info()    { echo -e "${GREEN}[*]${RESET} $*"; }
warn()    { echo -e "${YELLOW}[!]${RESET} $*"; }
error()   { echo -e "${RED}[-]${RESET} $*" >&2; exit 1; }
ok()      { echo -e "${GREEN}[+]${RESET} $*"; }

# ── OS detection ──────────────────────────────────────────────────────────────
detect_os() {
  if [[ -f /etc/arch-release ]]; then
    echo "arch"
  elif [[ -f /etc/lsb-release ]] && grep -q Ubuntu /etc/lsb-release; then
    echo "ubuntu"
  elif [[ -f /etc/debian_version ]]; then
    echo "debian"
  else
    error "Unsupported OS. Only Arch Linux and Ubuntu/Debian are supported."
  fi
}

OS=$(detect_os)

# ── Package installation ───────────────────────────────────────────────────────
_apt_updated=0

install_pkg() {
  local pkg=$1
  case "$OS" in
    arch)
      if ! pacman -Qi "$pkg" &>/dev/null; then
        info "Installing $pkg (pacman)..."
        sudo pacman -S --noconfirm "$pkg"
      else
        ok "$pkg already installed"
      fi
      ;;
    ubuntu|debian)
      if ! dpkg -l "$pkg" 2>/dev/null | grep -q "^ii"; then
        if [[ "$_apt_updated" == "0" ]]; then
          info "Updating apt package lists..."
          sudo apt-get update -qq
          _apt_updated=1
        fi
        info "Installing $pkg (apt)..."
        sudo apt-get install -y "$pkg"
      else
        ok "$pkg already installed"
      fi
      ;;
  esac
}

# ── Helpers ───────────────────────────────────────────────────────────────────
need_cmd() {
  command -v "$1" &>/dev/null || error "Required command not found: $1"
}

# Dotfile repo root (directory containing this scripts/ folder)
DOTFILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Clone a git repo only if target dir doesn't exist
clone_if_missing() {
  local url=$1 dest=$2
  if [[ -d "$dest" ]]; then
    ok "$dest already exists, skipping clone"
  else
    info "Cloning $url → $dest"
    git clone --depth=1 "$url" "$dest"
  fi
}

# Run stow for a package from the dotfile repo.
# Walk the package dir first and remove any plain (non-symlink) files in HOME
# that would conflict — stow version output formats differ so we avoid parsing them.
stow_pkg() {
  local pkg=$1 pkgdir rel target
  pkgdir="$DOTFILE_DIR/$pkg"
  info "Stowing $pkg..."
  while IFS= read -r -d '' src; do
    rel="${src#${pkgdir}/}"
    target="$HOME/$rel"
    if [[ -f "$target" && ! -L "$target" ]]; then
      warn "Backing up conflicting file: ~/$rel → ~/${rel}.bak"
      mv "$target" "${target}.bak"
    fi
  done < <(find "$pkgdir" -mindepth 1 -not -type d -print0)
  stow --dir="$DOTFILE_DIR" --target="$HOME" --restow "$pkg"
  ok "$pkg stowed"
}

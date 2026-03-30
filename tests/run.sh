#!/usr/bin/env bash
# Test runner — builds Docker image, runs install.sh, runs verify.sh
# Usage: ./tests/run.sh [ubuntu|arch|all]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILE_DIR="$(dirname "$SCRIPT_DIR")"

# Locate docker (handles Docker Desktop on WSL)
if command -v docker &>/dev/null; then
  DOCKER=docker
elif command -v docker.exe &>/dev/null; then
  DOCKER=docker.exe
else
  echo "[-] Docker not found" >&2; exit 1
fi

run_test() {
  local os=$1
  local image="dotfile-test-${os}"
  local dockerfile="$SCRIPT_DIR/Dockerfile.${os}"

  echo ""
  echo "══════════════════════════════════════"
  echo "  Testing on: ${os}"
  echo "══════════════════════════════════════"

  echo "[*] Building image ${image}..."
  $DOCKER build -t "$image" -f "$dockerfile" "$DOTFILE_DIR" --quiet

  echo "[*] Running install + verify..."
  $DOCKER run --rm \
    -v "${DOTFILE_DIR}:/home/testuser/.dotfile:ro" \
    -e DEBIAN_FRONTEND=noninteractive \
    "$image" \
    bash -c "bash ~/.dotfile/install.sh && bash ~/.dotfile/tests/verify.sh"

  echo ""
  echo "[+] ${os}: PASSED"
}

case "${1:-all}" in
  ubuntu) run_test ubuntu ;;
  arch)   run_test arch ;;
  all)    run_test ubuntu && run_test arch ;;
  *)      echo "Usage: $0 [ubuntu|arch|all]"; exit 1 ;;
esac

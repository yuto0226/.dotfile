# Local bins
export PATH="$HOME/.local/bin:$PATH"

# Go — hardcoded to avoid $(go env GOPATH) subprocess at startup
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# RISC-V
export RISCV="/opt/riscv"
export PATH="/opt/riscv/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

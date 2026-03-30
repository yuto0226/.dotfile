fpath+="$HOME/.zfunc"

# OpenClaw
[[ -f "$HOME/.openclaw/completions/openclaw.zsh" ]] && source "$HOME/.openclaw/completions/openclaw.zsh"

# bun
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# compinit with 24h dump cache — skips re-scanning fpath on every shell start
autoload -Uz compinit
if [[ -n "${HOME}/.zcompdump"(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

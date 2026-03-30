# ── Oh My Zsh ─────────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  tmux
  docker
  golang
  uv
  systemd
  rust
)

source $ZSH/oh-my-zsh.sh

# ── User config ───────────────────────────────────────────────────────────────
for _conf in "$HOME/.zsh/"{exports,path,aliases,fzf,tools,completions,tmux}.zsh; do
  [[ -f $_conf ]] && source "$_conf"
done
unset _conf

# ── p10k ──────────────────────────────────────────────────────────────────────
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Local overrides (tool injections go here, not tracked) ────────────────────
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

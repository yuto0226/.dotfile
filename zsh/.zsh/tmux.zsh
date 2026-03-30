# Auto-attach or create "temp" session when starting zsh outside tmux
if [[ -t 1 && -z "$TMUX" ]]; then
  if tmux has-session -t temp 2>/dev/null; then
    tmux attach-session -t temp
  else
    tmux new-session -s temp
  fi
fi

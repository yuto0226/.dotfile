[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--tmux \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --multi
  --border"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'
  "

export FZF_CTRL_T_OPTS="--tmux\
  --preview '(batcat {} || tree -C {}) 2> /dev/null | head -200'\
  --height 60% \
  --border\
  "

export FZF_ALT_C_OPTS="--tmux\
  --preview '(batcat {} || tree -C {}) 2> /dev/null | head -200'\
  --height 60% \
  --border\
  "

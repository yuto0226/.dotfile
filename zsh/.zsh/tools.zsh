# fnm — lazy-loaded: initializes only when node/npm/npx/yarn/pnpm/fnm is first called
FNM_PATH="$HOME/.local/share/fnm"
if [[ -d "$FNM_PATH" ]]; then
  export PATH="$FNM_PATH:$PATH"
  _fnm_init() {
    unset -f node npm npx yarn pnpm fnm
    eval "$(fnm env)"
  }
  for _cmd in node npm npx yarn pnpm fnm; do
    eval "${_cmd}() { _fnm_init; ${_cmd} \"\$@\"; }"
  done
  unset _cmd
fi

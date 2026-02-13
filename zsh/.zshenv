# Keep this file minimal and fast.
# It is sourced by all zsh invocations (interactive, non-interactive, login).

export LANG=en_US.UTF-8
export EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"

# Base PATH entries needed by tool-driven shells (Cursor/OpenAI, scripts, CI-like runs).
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Resolve and expose the default nvm Node version for non-interactive shells.
# Handles aliases like "default", "lts/*", and chained alias files.
if [ -d "$NVM_DIR/versions/node" ]; then
  _nvm_resolved=""
  _nvm_alias="$(cat "$NVM_DIR/alias/default" 2>/dev/null || true)"

  if [ -n "$_nvm_alias" ]; then
    while [ -n "$_nvm_alias" ]; do
      if [ -d "$NVM_DIR/versions/node/$_nvm_alias" ]; then
        _nvm_resolved="$_nvm_alias"
        break
      fi
      if [ -f "$NVM_DIR/alias/$_nvm_alias" ]; then
        _nvm_alias="$(cat "$NVM_DIR/alias/$_nvm_alias" 2>/dev/null || true)"
        continue
      fi
      break
    done
  fi

  if [ -z "$_nvm_resolved" ]; then
    _nvm_resolved="$(ls -1 "$NVM_DIR/versions/node" 2>/dev/null | sort -V | tail -n 1)"
  fi

  if [ -n "$_nvm_resolved" ] && [ -d "$NVM_DIR/versions/node/$_nvm_resolved/bin" ]; then
    export PATH="$NVM_DIR/versions/node/$_nvm_resolved/bin:$PATH"
  fi

  unset _nvm_alias _nvm_resolved
fi

# De-duplicate PATH while preserving first occurrence order.
typeset -U path PATH

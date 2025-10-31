# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/fhv/.oh-my-zsh"
# ZSH_THEME="candy"
ZSH_THEME="powerlevel10k/powerlevel10k"

# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(
    git 
    vi-mode 
    gitignore 
    extract 
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Load aliases if they exist.
[ -f "/Users/fhv/.config/zsh/.aliases" ] && source "/Users/fhv/.config/zsh/.aliases"

export PATH="/Users/fhv/.local/bin:$PATH"
# FIXME
# export PATH="$PATH:/Users/fhv/Projects/aws_server/bin"

export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_CMD="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_CMD"


# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


# FIXME
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export NNN_PLUG='o:fzopen;v:imgview;j:autojump;p:preview-tui'
export NNN_USE_EDITOR=1
export NNN_FIFO="/tmp/nnn.fifo"

source $ZSH/oh-my-zsh.sh

# Auto completion
fpath=( ~/.zfunc "${fpath[@]}" )
compinit

eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NNN
n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

source <(fzf --zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(uv generate-shell-completion zsh)"


# pnpm
export PNPM_HOME="/Users/fhv/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
export PATH="/opt/homebrew/bin:$PATH"

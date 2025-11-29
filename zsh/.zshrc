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
)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Load aliases if they exist.
[ -f "/Users/fhv/.config/zsh/.aliases" ] && source "/Users/fhv/.config/zsh/.aliases"

export PATH="/Users/fhv/.local/bin:$PATH"

export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_CMD="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_CMD"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export NNN_PLUG='j:autojump;p:preview-tui;c:cbcopy-mac;v:cbpaste-mac;r:gitroot'
export NNN_USE_EDITOR=1
export NNN_FIFO="/tmp/nnn.fifo"

source $ZSH/oh-my-zsh.sh

# # Auto completion
# fpath=( ~/.zfunc "${fpath[@]}" )
# compinit
#
# eval "$(/opt/homebrew/bin/brew shellenv)"
#
# autoload -Uz compinit
# zstyle ':completion:*' menu select
# fpath+=~/.zfunc

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


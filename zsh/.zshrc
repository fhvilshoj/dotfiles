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
    poetry
    web-search
)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Load aliases if they exist.
[ -f "/Users/fhv/.config/zsh/.aliases" ] && source "/Users/fhv/.config/zsh/.aliases"

export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/Users/fhv/.local/bin:$PATH"
export PATH="$PATH:/Users/fhv/command-line-applications/nnn"
export PATH="$PATH:/Users/fhv/Projects/aws_server/bin"

export OPENAI_API_KEY="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"

export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_CMD="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_CMD"

export NNN_BMS="h:~;p:~/PycharmProjects/data-quality-pocs;t:/tmp"
export NNN_PLUG='f:finder;o:fzopen;v:imgview;j:autojump;p:preview-tui'
export NNN_USE_EDITOR=1
export NNN_FIFO="/tmp/nnn.fifo"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

source $ZSH/oh-my-zsh.sh

# Auto completion
fpath=( ~/.zfunc "${fpath[@]}" )
compinit


eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fhv/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fhv/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fhv/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fhv/google-cloud-sdk/completion.zsh.inc'; fi

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc


# PYENV 
PATH="$(bash --norc -ec 'IFS=:; paths=($PATH);
for i in ${!paths[@]}; do
if [[ ${paths[i]} == "''/Users/fhv/.pyenv/shims''" ]]; then unset '\''paths[i]'\'';
fi; done;
echo "${paths[*]}"')"
export PATH="/Users/fhv/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source '/opt/homebrew/Cellar/pyenv/2.3.23/completions/pyenv.zsh'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fhv/command-line-applications/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fhv/command-line-applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fhv/command-line-applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fhv/command-line-applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


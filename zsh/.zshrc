autoload -Uz compinit
compinit

## load plugins
eval "$(sheldon source)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

export PATH="$HOME/.local/bin:$PATH"

## completions
fpath=($HOME/.docker/completions $fpath)
fpath+=$HOME/.zsh/completions

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

## alias
alias ls='lsd'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias lt='ls --tree'

alias ..='cd ..'

alias cp='cp -i -p -v'
alias rm='rm -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

function cd_with_sk() {
    if [[ "${1}" ]]; then
        cd "$(fd -LH . -t d ${1} 2>/dev/null | sk --preview="lsd --tree {}")"
    else
        cd "$(fd -LH . -t d --exclude .cache ${HOME} 2>/dev/null | sk --preview="lsd --tree {}")"
    fi
}
zle -N cd_with_sk
alias cdd=cd_with_sk

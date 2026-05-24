autoload -Uz compinit
compinit

eval "$(sheldon source)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

export PATH="$HOME/.local/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# alias
alias ls='lsd'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias lt='ls --tree'

alias ..='cd ..'

alias cp='-i -p -v'
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

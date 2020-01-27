# zplugin
source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# prezto
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi
# prezto

export TERM=xterm-color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zconfig/zplugin
source ~/.zconfig/zalias
source ~/.zconfig/zkeybind
source ~/.zconfig/zoptions
source ~/.zlocal

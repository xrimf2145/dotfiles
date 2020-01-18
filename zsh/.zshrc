# zplugin
source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

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

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

export ZCONFIG=$HOME/.zconfig
export FILENUM=$(ls -Ul $ZCONFIG | wc -l)

source $ZCONFIG/zplugin.zsh
source $ZCONFIG/zalias.zsh
source $ZCONFIG/zkeybind.zsh
source $ZCONFIG/zoptions.zsh
source $ZCONFIG/zstyle.zsh
source $HOME/.zlocal.zsh


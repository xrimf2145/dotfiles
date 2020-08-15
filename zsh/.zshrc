source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

for file in `fd . $ZCONFIG/ --type file`; do
	source $file
done

for file in `fd . $ZCONFIG/zplugin/ --type f`;do
	source $file
done

[ -f $HOME/.zlocal.zsh ] && source $HOME/.zlocal.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs

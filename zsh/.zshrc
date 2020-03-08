source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

while read -d $'\0' file; do
	source "${file}"
done < <(find $ZCONFIG/ -mindepth 1 -maxdepth 1 -print0)

while read -d $'\0' file; do
	source "${file}"
done < <(find $ZCONFIG/zplugin/ -mindepth 1 -maxdepth 1 -print0)

[ -f $HOME/.zlocal.zsh ] && source $HOME/.zlocal.zsh

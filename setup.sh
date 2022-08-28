#/bin/bash

CURRENT=$(cd $(dirname $0);pwd)
echo "${CURRENT}"

case $1 in
	'zsh' )
		ln -i -s $CURRENT/zsh/zshrc $HOME/.zshrc
		ln -i -s $CURRENT/zsh/zlogin $HOME/.zlogin
		ln -i -s $CURRENT/zsh/zprofile $HOME/.zprofile
		ln -i -s $CURRENT/zsh/zshenv $HOME/.zshenv
		ln -i -s $CURRENT/zsh/zlogout $HOME/.zlogout
		ln -i -s $CURRENT/zsh/zconfig $HOME/.zconfig
		;;
esac

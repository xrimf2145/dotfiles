#/bin/sh

DOTPATH=~/.dotfiles

for f in .??*
do
		echo $f

    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

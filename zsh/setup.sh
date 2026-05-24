#!/bin/zsh

for src in ${PWD}/**/\.z*; do
    targ="${HOME}/$(basename ${src})"
    # echo "$src --> $targ"
    ln -sFv "${src}" "${targ}"
done

ln -sFv "$(realpath sheldon)" "${HOME}/.config/sheldon"
ln -sFv "$(realpath starship.toml)" "${HOME}/.config/starship.toml"

source "${HOME}/.zshenv"
source "${HOME}/.zprofile"
source "${HOME}/.zshrc"

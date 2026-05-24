#!/bin/zsh

rustup completion zsh > .zsh/completions/_rustup
rustup completion zsh cargo > .zsh/completions/_cargo

for src in ${PWD}/**/\.z*; do
    targ="${HOME}/$(basename ${src})"
    ln -sFv "${src}" "${targ}"
done

ln -sFv "$(realpath sheldon)" "${HOME}/.config/sheldon"
ln -sFv "$(realpath starship.toml)" "${HOME}/.config/starship.toml"

source "${HOME}/.zshenv"
source "${HOME}/.zprofile"
source "${HOME}/.zshrc"

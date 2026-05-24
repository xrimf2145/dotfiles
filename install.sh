#!/bin/zsh

os="$(uname)"
echo "You are using ${os}"

use_only_apt='false'

case "${os}" in
    "Darwin")
        if [[ "${os}" == "Darwin" ]]; then
            command -v brew
            if [[ "${?}" != 0 ]]; then
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
        fi

        brew install \
            pure \
            clang-format

        brew install --cask \
            zed \
            ghostty
        ;;
    "Linux")
        apt-get install -y \
            build-essential \
            curl \
            pkg-config \
            libssl-dev
        ;;
    *)
        echo "${os} is unknown"
        exit 1
        ;;
esac

if [[ "${use_only_apt}" == 'true' ]]; then
    apt-get install -y \
        ripgrep \
        fd-find \
        bat \
        htop \
        lsd \
        sheldon \
        procs \
        skim \
        starship
else
    command -v cargo
    if [[ "${?}" != 0 ]]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        . "$HOME/.cargo/env"
    fi

    cargo install -v \
        cargo-binstall

    cargo binstall -v \
        bat \
        cross \
        fd-find \
        htop \
        lsd \
        ripgrep \
        sheldon \
        procs \
        skim \
        starship
fi

. "$HOME/.cargo/env"

if [[ "$(uname)" == 'Darwin' ]]; then
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

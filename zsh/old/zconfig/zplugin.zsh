# theme
#zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# essential's
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zaw
zinit light chrissicool/zsh-256color
zinit light zsh-users/zsh-history-substring-search 
#zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting

# additional
zinit load zdharma/history-search-multi-word
#zinit ice compile"*.lzui" from"notabug"
#zinit load zdharma/zui
#zinit ice from"gh-r" as"program"
#zinit load junegunn/fzf-bin
#zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"; zplugin load docker/compose
#zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
#zinit light vim/vim
#zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
#zinit light tj/git-extras
#zinit snippet OMZ::plugins/git/git.plugin.zsh
#zinit cdclear -q

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'

filetype plugin indent on

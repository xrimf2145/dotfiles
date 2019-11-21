" setting
if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" True Color対応
if has('nvim')
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Or if you have Neovim >= 0.1.5
  if (has("termguicolors"))
    set termguicolors
  endif
elseif has('patch-7.4.1778')
  set guicolors
endif

let s:dein_cache_path = expand('~/.cache/nvim/dein')
let s:dein_dir = s:dein_cache_path
      \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})
  call dein#load_toml('~/.config/nvim/dein.toml')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
" colorscheme edge
colorscheme lucius

runtime! ./options.rc.vim
runtime! ./keymap.rc.vim
runtime! ./functions.rc.vim

let g:dein#auto_recache = 1

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" template
let g:sonictemplate_vim_template_dir = [
      \ '~/.config/template/'
      \]

" LaTeX
let g:latex_latexmk_options = '-pdf'

" Include macros like `\jhat` from MathJax and KaTeX.
let g:deoplete#sources#latex#include_web_math = 1  " default 0

" Include a hodgepodge of miscellaneous commands and environments.
let g:deoplete#sources#latex#include_misc = 1      " default 0

" japanese
"set ttimeout
"set ttimeoutlen=50

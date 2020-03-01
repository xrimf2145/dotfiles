if &compatible
	set nocompatible
endif

augroup MyAutoCmd
	autocmd!
augroup END

if has('nvim')
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
colorscheme lucius

runtime! ./options.rc.vim
runtime! ./keymap.rc.vim
runtime! ./functions.rc.vim

let g:dein#auto_recache = 1

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

set termguicolors
"set pumblend=10

" template
let g:sonictemplate_vim_template_dir = [
			\ '~/.config/nvim/template'
			\]

" LaTeX
let g:latex_latexmk_options = '-pdf'

" Include macros like `\jhat` from MathJax and KaTeX.
let g:deoplete#sources#latex#include_web_math = 1  " default 0

" Include a hodgepodge of miscellaneous commands and environments.
let g:deoplete#sources#latex#include_misc = 1      " default 0

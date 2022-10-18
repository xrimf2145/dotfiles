vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'Shougo/ddc.vim',
	}

	use 'vim-denops/denops.vim'
	use 'Shougo/pum.vim'
	use 'Shougo/ddc-around'
	use 'LumaKernel/ddc-file'
	use 'Shougo/ddc-matcher_head'
	use 'Shougo/ddc-sorter_rank'
	use 'Shougo/ddc-converter_remove_overlap'

	use 'mattn/vim-lsp-settings'
	use 'prabirshrestha/vim-lsp'

	use 'neovim/nvim-lspconfig'

	use 'rstacruz/vim-closer'
	use 'mattn/sonictemplate-vim'

	use 'rafi/awesome-vim-colorschemes'

	use 'neovim/nvim-lspconfig'
end)

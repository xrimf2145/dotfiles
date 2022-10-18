local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

keymap("n", "<Down>", "gj", opts)
keymap("n", "<UP>", "gk", opts)

keymap("n", "<C-j>" ,":bprev<CR>", opts)
keymap("n", "<C-k>" ,":bnext<CR>", opts)

keymap("n", "<C-j>", "<Down>", opts)
keymap("n", "<C-k>", "<Up>", opts)
keymap("n", "<C-h>", "<Left>", opts)
keymap("n", "<C-l>", "<Right>", opts)

keymap("n", "<C-B>", ":VimtexCompile<CR>", opts)
keymap("n", "<C-C>", ":VimtexClean<CR>", opts)


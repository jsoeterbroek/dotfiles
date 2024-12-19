-- Global configuration
--
-- Do this stuff before loading plugins so that plugins have a consistent behavior.
-- Set the leader key to spacebar.
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.rg_command = "rg --vimgrep -S"

require("jsoeterbroek/options")
require("jsoeterbroek/keymaps")
require("jsoeterbroek/lazy_bootstrap")
require("jsoeterbroek/lazy_init")

-- For some reason, Neovim is not recognizing the templ file extension.
-- There is probably a better way to do this, but this is fine for now.
vim.cmd([[autocmd BufNewFile,BufRead *.templ set ft=templ]])

-- ruff
require'lspconfig'.ruff.setup{}

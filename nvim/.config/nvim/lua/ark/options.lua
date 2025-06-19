-- ~/.config/nvim/lua/ark/options.lua

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = false

-- Custom highlights
vim.cmd [[highlight LineNr guifg=#ffffff ctermfg=249]]
vim.cmd [[highlight Comment guifg=#709c95 ctermfg=255]]
vim.api.nvim_set_hl(0, "@lsp.type.property.lua", { fg= "#c7a1c7", ctermfg=175 })
vim.api.nvim_set_hl(0, "tmuxFormatString", { fg= "#c7a1c7", ctermfg=10 })
vim.api.nvim_set_hl(0, "tmuxFlags", { fg= "#c7a1c7", ctermfg=153 })

-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1 
vim.opt.foldnestmax = 4


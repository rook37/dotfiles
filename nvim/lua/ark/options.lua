-- ~/.config/nvim/lua/ark/options.lua
--

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
--vim.opt.termguicolors = false
vim.opt.linespace = 2
--vim.opt.numberwidth = 8
--vim.opt.signcolumn = "yes:1"

-- Custom highlights
vim.cmd [[highlight LineNr guifg=#ffffff ctermfg=249]]
vim.cmd [[highlight Comment guifg=#709c95 ctermfg=255]]
vim.api.nvim_set_hl(0, "@lsp.type.property.lua", { fg= "#c7a1c7", ctermfg=175 })
vim.api.nvim_set_hl(0, "tmuxFormatString", { fg= "#c7a1c7", ctermfg=10 })
vim.api.nvim_set_hl(0, "tmuxFlags", { fg= "#c7a1c7", ctermfg=153 })

vim.cmd [[
  highlight! link LineNr Normal
  highlight! link SignColumn Normal
  highlight! link GitSignsAdd LineNr
  highlight! link GitSignsChange LineNr
  highlight! link GitSignsDelete LineNr
  highlight DiagnosticSignWarn guibg=#1f1f28
  highlight DiagnosticSignHint guibg=#1f1f28
]]

-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 4 
vim.opt.foldnestmax = 4


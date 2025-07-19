-- ~/.config/nvim/lua/ark/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>e', ':Neotree toggle filesystem reveal left<CR>', opts)
map('n', '<leader>q', ':bd<CR>', opts)
map('n', '<leader>ff', function()
  require('telescope.builtin').find_files()
end, { desc = 'Find files' })


-- Visual mode: Wrap selection in tag
map('v', '<leader>t', function()
  local tag = vim.fn.input("Tag: ")
  vim.cmd('normal! `<v`>d')
  local text = vim.fn.getreg('"')
  vim.fn.setreg('"', '<' .. tag .. '>' .. text .. '</' .. tag .. '>')
  vim.cmd('normal! P')
end, { desc = "Wrap with tag" })


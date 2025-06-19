-- ~/.config/nvim/lua/ark/plugins.lua

local lazypath = vim.fn.stdpath('config') .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- File tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
          "lua", "javascript", "typescript", "tsx", "go", "python", "html", "css", "json"
        },
      })
    end
  },

  -- Tag autoclosing
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "tsx", "vue", "svelte", "xml" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Bracket/quote pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Text surround (tags/brackets/etc)
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- LSP setup
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "pyright", "lua_ls" },
      })

      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      })
    end
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{}
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }
      })
    end
  }
})


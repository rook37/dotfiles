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

    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup({
          close_if_last_window = true, -- auto-close when it's the only window
          window = {
            width = 30,
          },
          filesystem = {
            follow_current_file = { enabled = true },
            hijack_netrw_behavior = "open_default",
          },
        })
      end,
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

  --Image viewer

{
  "3rd/image.nvim",
  config = function()
    require("image").setup({
      backend = "kitty",
      processor = "magick_cli", -- or "magick_rock"
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          only_render_image_at_cursor_mode = "popup",
          floating_windows = false, -- if true, images will be rendered in floating markdown windows
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          filetypes = { "norg" },
        },
        typst = {
          enabled = true,
          filetypes = { "typst" },
        },
        html = {
          enabled = false,
        },
        css = {
          enabled = false,
        },
      }, -- ✅ closes the integrations table
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/loses focus
      tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
    })
  end,
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
  -- theme --
    {
      'rebelot/kanagawa.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'kanagawa-wave'  -- Options: 'wave', 'dragon', 'lotus'
      end,
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


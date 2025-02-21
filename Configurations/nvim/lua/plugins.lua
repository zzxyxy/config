-- Automatically install packer if not already installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Use packer to manage plugins
require("packer").startup(function(use)
  use "wbthomason/packer.nvim" -- Packer manages itself

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground'
    },
    config = function()
      require('config.treesitter')
    end
  }

  use 'morhetz/gruvbox'

  use {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',      -- Buffer source for nvim-cmp
      'hrsh7th/cmp-path',        -- Path source for nvim-cmp
      'hrsh7th/cmp-cmdline',     -- Command line source for nvim-cmp
--      'L3MON4Di3/LuaSnip',        -- Snippet engine
      'saadparwaiz1/cmp_luasnip',-- Snippet completions
    },
    config = function()
      require('config.cmp')
    end
  }

  -- LSP configurations
  use {
     "neovim/nvim-lspconfig",
     config = function()
       require('config.lspconfig')
     end
  }

  use 'tpope/vim-fugitive'

  use 'itchyny/lightline.vim'
  use 'joshdick/onedark.vim'  -- One Dark theme

  -- Formatters and linters as LSP sources
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('config.null_ls')
    end
  }
  use 'mfussenegger/nvim-lint'              -- Lightweight linter

  -- Debugging
  -- Debug Adapter Protocol
  use {
    'mfussenegger/nvim-dap',
    config = function()
      require('config.dap')
    end
  }

  -- File management
  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('config.telescope')
    end
  }

  -- Git integration
  use 'tpope/vim-fugitive'                  -- Git commands within Neovim
  use 'lewis6991/gitsigns.nvim'

  use {
    'dhruvasagar/vim-table-mode',
    config = function()
        -- Enable table mode settings
        vim.g.table_mode_corner = '|'
        vim.g.table_mode_header_fillchar = '='
        vim.g.table_mode_corner_corner = ' '
        vim.g.table_mode_default_mapping = 1
        vim.g.table_mode_preserve_formatting = 1
        vim.g.table_mode_custom_mappings = {
           padd_column_separators = true,   -- Insert a space around column separators.
              mappings = {                     -- Mappings customization
                next = '<TAB>',              -- Go to next cell.
                prev = '<S-TAB>',            -- Go to previous cell.
                insert_row_up = '<A-k>',     -- Insert row above cursor
              }
          }
    end
  }

  -- Add gitsigns.nvim for Git indicators and hunk management
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = {text = '+'},
          change       = {text = '~'},
          delete       = {text = '_'},
          topdelete    = {text = '‾'},
          changedelete = {text = '~'},
        },
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      numhl = true,              -- Highlights line numbers for changed lines
      }
    end
  }

  use {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_enabled = 1
    end
  }

  use {
    "folke/twilight.nvim",
    config = function()
      require('config.twilight')
    end
  }

  use {
    "epwalsh/obsidian.nvim",
    tag = "*",
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require('config.obsidian')
    end
  }

  use {
    'hashivim/vim-terraform',
    config = function()
      require('config.terraform')
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

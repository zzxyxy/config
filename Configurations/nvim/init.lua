vim.env.LANG='en_US.UTF-9'

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

  -- Add other plugins here
  -- For example: use "neovim/nvim-lspconfig"
  use "wbthomason/packer.nvim"        -- Packer manages itself
  use "neovim/nvim-lspconfig"         -- LSP configurations
  use "hrsh7th/nvim-cmp"              -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'    -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'      -- Buffer source for nvim-cmp
  use 'hrsh7th/cmp-path'        -- Path source for nvim-cmp
  use 'hrsh7th/cmp-cmdline'     -- Command line source for nvim-cmp
  use 'L3MON4D3/LuaSnip'        -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'-- Snippet completions
  use 'scrooloose/nerdtree' -- File explorer
  use 'nvim-treesitter/nvim-treesitter' -- Enhanced syntax highlighting
  use 'tpope/vim-fugitive'

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
  -- Automatically set up your configuration after cloning packer.nvim

  use {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_enabled = 1
    end
  }
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- Required - set up the snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the git source if you have installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup LSP with nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.yamlls.setup { capabilities = capabilities }
lspconfig.helm_ls.setup { capabilities = capabilities }
-- Add other LSP setups here if needed


vim.cmd [[
  autocmd BufRead,BufNewFile */templates/*.yaml set filetype=helm
]]

local lspconfig = require('lspconfig')

lspconfig.yamlls.setup{
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow"] = "/.github/workflows/*",
                ["https://json.schemastore.org/github-action"] = "/action.yml"
            },
            validate = true,
            format = {
                enable = true
            },
            hover = true,
            completion = true
        },
    },
    filetype = { "yaml" },
}

lspconfig.helm_ls.setup{
    cmd = { "helm-ls", "serve" },
    filetypes = { "helm" },
    root_dir = lspconfig.util.root_pattern("Chart.yaml"),
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python", "lua", "javascript", "yaml", "yamlls"},  -- Replace with the file types you want
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.cursorline = true
    vim.opt_local.smartindent = true
  end,
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "yaml", "lua"}, -- or specify languages {"python", "javascript"}
  highlight = {
    enable = true,
  },
}

vim.g.mapleader = ","
vim.o.background = "dark"
vim.cmd("highlight Normal guibg=black")
vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<")
vim.cmd("set list")
vim.api.nvim_set_keymap('n', '<leader>nt', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.cmd([[command! Nt NERDTreeToggle]])

vim.cmd [[
  augroup helm_syntax
    autocmd!
    autocmd FileType helm setlocal syntax=yaml
  augroup END
]]

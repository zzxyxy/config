require('nvim-treesitter.configs').setup({
    ensure_installed = { "markdown", "markdown_inline", "lua", "vim", "bash", "python", "hcl" }, -- Install parsers for your needs
    highlight = {
      enable = true, -- Enable syntax highlighting
      additional_vim_regex_highlighting = false,
    },
    fold = { enable = true }
})

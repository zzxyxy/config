vim.env.LANG='en_US.UTF-8'

require('plugins')

require('gitsigns').setup {}

local builtin = require('telescope.builtin')
vim.opt.conceallevel = 1

vim.g.mapleader = "."
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format file' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Find references' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ot", ":ObsidianTags<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>oj", ":ObsidianToday<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cc', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', ' ', 'zA', { noremap = true, silent = true })

vim.g.render_markdown_browser = 'brave'
vim.cmd("highlight Normal guibg=black")
vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.tabstop = 2       -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2    -- Number of spaces used for auto-indentation
vim.opt.expandtab = true
vim.o.background = "dark"
vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<")
vim.cmd("set list")
vim.cmd([[command! Nt NERDTreeToggle]])
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.g.lightline = {
    colorscheme = 'gruvbox', -- Change to your preferred theme (e.g., 'onedark', 'gruvbox')
}

vim.cmd("colorscheme gruvbox")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "terraform",
  callback = function()
    vim.cmd("setlocal syntax=terraform")
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.foldlevel = 0 -- Fold only the first level
    vim.opt_local.foldenable = true -- Enable folding by default
  end,
})

vim.cmd("highlight Normal guibg=#000000 guifg=#FFFFFF") -- Black background, white text
vim.cmd("highlight LineNr guibg=#000000 guifg=#5E5E5E") -- Dim line numbers
vim.cmd("highlight StatusLine guibg=#000000 guifg=#5E5E5E") -- Dark status line

local colors = {
    bg = "#000000",
    fg = "#b3b3b3",
    text = "#b3b3b3",
    gray = "#666666",
    dark_gray = "#444444",
    light_gray = "#d4d4d4",
    border = "#444444",
}
-- Customize colors for a minimalist gray look
vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg, fg = colors.fg })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.gray, italic = true })
vim.api.nvim_set_hl(0, "String", { fg = "#7fa650" })
vim.api.nvim_set_hl(0, "Number", { fg = "#569cd6" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#315cbf"  })
vim.api.nvim_set_hl(0, "Function", { fg = "#76d1d1" })
vim.api.nvim_set_hl(0, "Keyword", { fg = "#f0f6ff" })
vim.api.nvim_set_hl(0, "Boolean", { fg = "#b8bb26" })
vim.api.nvim_set_hl(0, "Null", { fg = "#98c379" })
vim.api.nvim_set_hl(0, "Error", { fg = "#cc3333" })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#ff9900" })

vim.cmd [[
  augroup helm_syntax
    autocmd!
    autocmd FileType helm setlocal syntax=yaml
    autocmd FileType markdown TableModeEnablei
    autocmd BufRead,BufNewFile */templates/*.yaml set filetype=helm
 augroup END
]]

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! loadview") -- Reload folds after saving
  end,
})

vim.o.foldlevel = 99
vim.opt.colorcolumn = "80"

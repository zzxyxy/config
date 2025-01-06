vim.env.LANG='en_US.UTF-8'

require('plugins')

require('gitsigns').setup {}

local builtin = require('telescope.builtin')
vim.g.mapleader = "."
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format file' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Find references' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", { noremap = true, silent = true })
vim.g.render_markdown_browser = 'brave'
vim.cmd("highlight Normal guibg=black")
vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.tabstop = 2       -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2    -- Number of spaces used for auto-indentation
vim.opt.expandtab = true
vim.o.background = "dark"
vim.g.vimtex_quickfix_mode = 0  -- Disable quickfix auto open on compile
vim.g.vimtex_fold_enabled = 0   -- Enable folding
vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<")
vim.cmd("set list")
vim.cmd([[command! Nt NERDTreeToggle]])
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.g.lightline = {
    colorscheme = 'onedark', -- Change to your preferred theme (e.g., 'onedark', 'gruvbox')
}
vim.cmd("colorscheme onedark")

vim.cmd("highlight Normal guibg=#000000 guifg=#FFFFFF") -- Black background, white text
vim.cmd("highlight LineNr guibg=#000000 guifg=#5E5E5E") -- Dim line numbers
vim.cmd("highlight StatusLine guibg=#000000 guifg=#5E5E5E") -- Dark status line

vim.cmd [[
  augroup helm_syntax
    autocmd!
    autocmd FileType helm setlocal syntax=yaml
    autocmd FileType markdown TableModeEnable
    autocmd BufRead,BufNewFile */templates/*.yaml set filetype=helm
 augroup END
]]

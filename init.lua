-- Plugins... duh
require('plugins')
-- Some helpful functions for inspecting lua globals (P(table), R(module))
require('globals')
-- Settings for the builtin LSP
require('lsp_settings')
-- Settings for autocomplete
require('completion')
-- Settings for built in treesitter
require('treesitter')
-- Just use gcc for comment (works in visual/visual line mode as well)
require('Comment').setup()

local user = os.getenv("USER")
local homedir = os.getenv("HOME")

vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.undodir = homedir .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'yes'

local dap = require('dap')
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { homedir .. '/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
  }
}
require('dap-python').setup(homedir .. '/.virtualenvs/debugpy/bin/python')

local nnoremap = function(lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = true
    vim.keymap.set('n', lhs, rhs, opts)
end

-- Debugging
nnoremap('<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
nnoremap('<Leader>bc', "<cmd>lua require'dap'.continue()<CR>")
nnoremap('<Leader>bo', "<cmd>lua require'dap'.step_over()<CR>")
nnoremap('<Leader>bi', "<cmd>lua require'dap'.step_into()<CR>")
nnoremap('<Leader>br', "<cmd>lua require'dap'.repl.open()<CR>")

-- Telescope!!
nnoremap('<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap('<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap('<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap('<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")

-- Undotree
nnoremap('<F5>', ':UndotreeToggle<CR>')

-- Markdown formatting
nnoremap('<Leader>p', ':Glow<CR>')

-- Testing lua plugins (_spec.lua)
nnoremap('<Leader>t', '<Plug>PlenaryTestFile')

-- Opening up the terminal?
nnoremap('<Leader>tr', ':terminal<CR>')
-- Getting out of the terminal
vim.keymap.set('t', '<Leader><Esc>', '<C-\\><C-n>', {noremap = true})

-- When sharing screen to toggle normal line numbers
nnoremap('<Leader>n', ':set relativenumber!<CR>')

-- Save/source the currently opened file
nnoremap('<Leader><Leader>x', ':w<CR>:source %<CR>')

vim.cmd [[
    colorscheme gruvbox
    highlight Normal guibg=none
    " automatically rebalance windows on vim resize
    autocmd VimResized * :wincmd =
    " zoom a vim pane, <C-w>= to re-balance
    nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
    nnoremap <leader>= :wincmd =<cr>
    let g:VtrStripLeadingWhitespace = 0
    let g:VtrClearEmptyLines = 0
    let g:VtrAppendNewline = 1
    let g:loaded_perl_provider = 0
]]


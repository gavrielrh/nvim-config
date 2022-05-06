require('plugins')
require('lsp_settings')
require('completion')
require('treesitter')

require('Comment').setup()

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
vim.opt.undodir = '~/.vim/undodir'
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
  args = { '/Users/grachaelhomann/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
  }
}
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

vim.api.nvim_set_keymap(
    'n',
    '<Leader>b',
    "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
    {noremap = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<Leader>bc',
    "<cmd>lua require'dap'.continue()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<Leader>bo',
    "<cmd>lua require'dap'.step_over()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<Leader>bi',
    "<cmd>lua require'dap'.step_into()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<Leader>br',
    "<cmd>lua require'dap'.repl.open()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<Leader>ff',
    "<cmd>lua require('telescope.builtin').find_files()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<Leader>fg',
    "<cmd>lua require('telescope.builtin').live_grep()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<Leader>fb',
    "<cmd>lua require('telescope.builtin').buffers()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<Leader>fh',
    "<cmd>lua require('telescope.builtin').help_tags()<CR>",
    {noremap = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<F5>',
    ':UndotreeToggle<CR>',
    {noremap = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<Leader>p',
    ':Glow<CR>',
    {noremap = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<Leader>t',
    ':terminal<CR>',
    {noremap = true}
)

vim.api.nvim_set_keymap(
    't',
    '<Leader><Esc>',
    '<C-\\><C-n>',
    {noremap = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<Leader>n',
    ':set relativenumber!<CR>',
    {noremap = true}
)

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


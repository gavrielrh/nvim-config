require('plugins')

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

vim.cmd [[
    colorscheme gruvbox
    highlight Normal guibg=none
]]


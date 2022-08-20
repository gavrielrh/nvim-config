-- Caching for blazingly fast start times
require('impatient')
-- Plugins... duh
require('plugins')
-- Some helpful functions for inspecting lua globals (P(table), R(module))
require('globals')
-- Settings for the builtin LSP
require('lsp_settings')
-- Settings for autocomplete
require('completion')

-- local user = os.getenv("USER")
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

local map = function(mode, lhs, rhs, opts)
    opts = opts or {
        noremap = true,
        silent = true
    }
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Pokemon!!
-- map('i', '<C-P>', require("pokemon").insert_random_pokemon)
-- map('i', '<C-P>', safe_require("pokemon").insert_random_pokemon_move)

-- Buffer movement
map('n', '<A-l>', ":BufferLineCycleNext<CR>")
map('n', '<A-h>', ":BufferLineCyclePrev<CR>")
map('n', '<A-j>', ":BufferLinePick<CR>")

for i = 1, 10 do
    map('n', '<A-' .. i .. '>', ":BufferLineGoToBuffer " .. i .. "<CR>")
end

-- Debugging
map('n', '<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
map('n', '<Leader>bc', "<cmd>lua require'dap'.continue()<CR>")
map('n', '<Leader>bo', "<cmd>lua require'dap'.step_over()<CR>")
map('n', '<Leader>bi', "<cmd>lua require'dap'.step_into()<CR>")
map('n', '<Leader>br', "<cmd>lua require'dap'.repl.open()<CR>")

-- Telescope!!
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
map('n', '<Leader>fr', "<cmd>lua require('telescope.builtin').registers()<CR>")
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")

-- Undotree
map('n', '<F5>', ':UndotreeToggle<CR>')

-- Filetree
map('n', '<F4>', ':NvimTreeToggle<CR>')

-- Markdown formatting
-- nnoremap('<Leader>p', ':Glow<CR>')

-- Testing lua plugins (_spec.lua)
map('n', '<Leader>t', '<Plug>PlenaryTestFile')

-- Opening up the terminal?
map('n', '<Leader>tr', ':terminal<CR>')
-- Getting out of the terminal
map('t', '<Leader><Esc>', '<C-\\><C-n>')

-- When sharing screen to toggle normal line numbers
map('n', '<Leader>n', ':set relativenumber!<CR>')

-- Save/source the currently opened file
map('n', '<Leader><Leader>x', ':w<CR>:source %<CR>')

-- Trouble keymaps
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- Autocommand grouping for Yank related events
local on_yank_group = vim.api.nvim_create_augroup("OnYank", { clear = true })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    -- command = "silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=150 }",
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
    end,
    group = on_yank_group,
})

-- Autocommand grouping for Resize related events
local on_resize_group = vim.api.nvim_create_augroup("OnResize", { clear = true })

-- automatically rebalance windows on vim resize
vim.api.nvim_create_autocmd({ "VimResized" }, {
    command = ":wincmd =",
    group = on_resize_group,
})

-- Maximize current buffer
map('n', '<leader>-', ':wincmd _<cr>:wincmd |<cr>')
-- Restore current buffer size
map('n', '<leader>=', ':wincmd =<cr>')

-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

vim.g['VtrStripLeadingWhitespace'] = 0
vim.g['VtrClearEmptyLines'] = 0
vim.g['VtrAppendNewline'] = 1
vim.g['loaded_perl_provider'] = 0

-- Get that sweet sweet screen real-estate
vim.o['cmdheight'] = 0

vim.cmd [[highlight Normal guibg=none]]

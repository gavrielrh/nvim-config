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

local random_pokemon = function()
    local res = require("pokeapi").get_resources("pokemon", 100000, 0)
    if res then
        local results = res['results']
        local index = math.random(1, #results)
        return results[index]['name']
    end
end

local insert_random_pokemon = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local row = pos[1] - 1
    local col = pos[2]
    local pokemon = random_pokemon() .. " "
    vim.api.nvim_buf_set_text(0, row, col, row, col, { pokemon })
    vim.api.nvim_win_set_cursor(0, { row + 1, col + #pokemon })
end

map('i', '<C-P>', insert_random_pokemon)

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

-- Make a group that auto-clears auto-commands to avoid duplicate registers
local resize_group = vim.api.nvim_create_augroup("OnResize", { clear = true })

-- automatically rebalance windows on vim resize
vim.api.nvim_create_autocmd({"VimResized"}, {
    pattern = {"*"},
    command = ":wincmd =",
    group = resize_group,
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
vim.cmd[[colorscheme tokyonight]]


vim.g['VtrStripLeadingWhitespace'] = 0
vim.g['VtrClearEmptyLines'] = 0
vim.g['VtrAppendNewline'] = 1
vim.g['loaded_perl_provider'] = 0

vim.cmd [[highlight Normal guibg=none]]

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP!!
    use 'neovim/nvim-lspconfig'
    use "williamboman/nvim-lsp-installer"
    use 'folke/lsp-colors.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'

    use 'lewis6991/impatient.nvim'

    -- Git
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- Colorscheme
    use 'gruvbox-community/gruvbox'
    -- use 'sonph/onehalf'
    use 'folke/tokyonight.nvim'

    -- Undotree
    use 'mbbill/undotree'

    -- Tmux
    use 'christoomey/vim-tmux-navigator'
    use 'christoomey/vim-tmux-runner'

    -- Markdown preview
    use {"ellisonleao/glow.nvim", branch = 'main'}

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'
    use 'rcarriga/cmp-dap'

    -- Comments
    use { 'numToStr/Comment.nvim' }

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'

    -- Docs
    use 'nanotee/luv-vimdocs'
    use 'milisims/nvim-luaref'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Filetree
    use 'kyazdani42/nvim-tree.lua'

    -- Tabs
    use { 'akinsho/bufferline.nvim', tag = "v2.*" }

    -- Troubleshooting list
    use "folke/trouble.nvim"

    -- Status line
    use 'nvim-lualine/lualine.nvim'

    -- Personal
    use 'gavrielrh/pokeapi.nvim'
end)


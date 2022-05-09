-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP!!
  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Git
  use 'tpope/vim-fugitive'

  -- Colorscheme
  use 'gruvbox-community/gruvbox'
  -- use 'sonph/onehalf'

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

  -- Comments
  use { 'numToStr/Comment.nvim' }

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'

  -- Docs
  use 'nanotee/luv-vimdocs'
  use 'milisims/nvim-luaref'

  -- Personal
  -- use '/home/mudribbit/plugins/stackmap.nvim'
  use '/home/mudribbit/plugins/pokeapi.nvim'
end)


return {
  -- Packer can manage itself
  'wbthomason/packer.nvim',

  -- LSP!!
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'folke/lsp-colors.nvim',
  'folke/neodev.nvim',
  'jose-elias-alvarez/nvim-lsp-ts-utils',

  -- Telescope
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'nvim-treesitter/playground',

  'lewis6991/impatient.nvim',

  -- Git
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',

  -- Colorscheme
  -- use 'sonph/onehalf'
  -- use 'folke/tokyonight.nvim'
  { 'catppuccin/nvim', name = 'catppuccin' },

  -- Undotree
  'mbbill/undotree',

  -- Tmux
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',

  -- Markdown preview
  { 'ellisonleao/glow.nvim', branch = 'main' },

  -- Completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'onsails/lspkind.nvim',
  'rcarriga/cmp-dap',

  -- Comments
  'numToStr/Comment.nvim',

  -- Debugging
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-dap-python',

  -- Docs
  'nanotee/luv-vimdocs',
  'milisims/nvim-luaref',

  -- Icons
  'kyazdani42/nvim-web-devicons',

  -- Filetree
  'kyazdani42/nvim-tree.lua',

  -- Tabs
  { 'akinsho/bufferline.nvim', version = 'v2.*' },

  -- Troubleshooting list
  'folke/trouble.nvim',

  -- Status line
  'nvim-lualine/lualine.nvim',

  -- Formatting
  'mhartington/formatter.nvim',

  -- Helpers
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
  },

  -- Wooo pretty tmux-pipeline
  -- use 'vimpostor/vim-tpipeline'

  -- Project
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  -- mini stuff
 'echasnovski/mini.nvim',

  {
    'MrcJkb/haskell-tools.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    -- tag = 'x.y.z' -- [^1]
  },

  -- Personal
  'gavrielrh/pokeapi.nvim',
}

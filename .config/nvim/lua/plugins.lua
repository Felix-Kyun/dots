--                    ______     ___           __ __
--                   / ____/__  / (_)  __     / //_/_  ____  ______
--                  / /_  / _ \/ / / |/_/    / ,< / / / / / / / __ \
--                 / __/ /  __/ / />  <     / /| / /_/ / /_/ / / / /
--                /_/    \___/_/_/_/|_|____/_/ |_\__, /\__,_/_/ /_/
--                                   /_____/    /____/
-- 				                  nvim config [plugins.lua]

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)


  -- let packer manage itself
  use 'wbthomason/packer.nvim'

  -- nord theme
  use 'shaunsingh/nord.nvim'

  -- nest nvim 
  use {
    'LionC/nest.nvim',
    config = [[require 'config.nest']],
  }

  -- impatient nvim 
  use 'lewis6991/impatient.nvim'

  -- plenery 
  use 'nvim-lua/plenary.nvim'

  -- web dev icons
  use {
    'kyazdani42/nvim-web-devicons',
    event = 'VimEnter',
    config = [[require('nvim-web-devicons')]],
  }

  -- nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    event = 'CursorHold',
    config = [[require('config.nvim-tree')]],
  }

  -- lualine 
  use {
    "nvim-lualine/lualine.nvim",
    event = 'VimEnter',
    config = [[require 'config.lualine']],
  }

  -- telescope 
  use {
    'nvim-telescope/telescope.nvim',
    event = 'CursorHold',
    -- config = [[require 'config.telescope]],
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    after = 'telescope.nvim',
    run = 'make',
    config = [[require('telescope').load_extension 'fzf']],
  }

  use {
    'nvim-telescope/telescope-symbols.nvim',
    after = 'telescope.nvim'
  }

  -- which key
  use {
    "folke/which-key.nvim",
    event = 'CursorHold',
    config = [[require 'config.which-key']]
  }

  -- dashboard
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = [[require 'config.dashboard']]
  }

  --fidget for lsp
  use {
    'j-hui/fidget.nvim',
    event = 'BufRead',
    after = 'lualine.nvim',
    config = [[require 'config.fidget']]
  }

  -- indent line 
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = [[require 'config.indent']]
  }

  -- colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'CursorHold',
    config = [[require('colorizer').setup()]]
  }

  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = [[require('gitsigns').setup()]]
  }

  -- navigator
  use {
    'numToStr/Navigator.nvim',
    event = 'CursorHold',
    config = [[require('Navigator').setup()]]
  }

  -- hopper
  use {
    'phaazon/hop.nvim',
    event = 'BufRead',
    config = [[require 'config.hop']]
  }

  -- comment
  use {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = [[require('Comment').setup()]],
  }

  -- surround 
  use {
    'tpope/vim-surround',
    event = 'BufRead',
    requires = {
      {
        'tpope/vim-repeat',
        event = 'BufRead'
      }
    }
  }

  -- splitjoin
  use {
    'AndrewRadev/splitjoin.vim',
    event = 'CursorHold'
  }

  -- autopairs
  use {
	  "windwp/nvim-autopairs",
    event = 'InsertCharPre',
    before = 'nvim-cmp',
    config = [[require("nvim-autopairs").setup()]]
  }

  -- trouble
  use {
  "folke/trouble.nvim",
  event = 'BufRead',
  config = [[require("trouble").setup()]]
  }

  -- terminal
  use {
    "akinsho/toggleterm.nvim",
    event = 'CursorHold',
    config = [[require('toggleterm').setup()]],
  }

  -- neoscroll
  use{
   'karb94/neoscroll.nvim',
   event = 'WinScrolled',
   config = [[require('neoscroll').setup({ hide_cursor = false })]],
  }

  --bufferline
  use {
    'akinsho/bufferline.nvim',
    event = 'BufRead',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('config.bufferline').setup() end,
  }

  use { 'nvim-lua/popup.nvim' }

  use {
    'Pocco81/true-zen.nvim',
    config = function() require('true-zen').setup() end,
    event = 'BufRead',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'CursorHold',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    config = function() require 'config.lsp' end,
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- context.vim replacemnt with treesitter 
  use {
    'nvim-treesitter/nvim-treesitter-context',
   config = [[require 'config.lspkind']],
  }

  -- transparent.nvim to make it transparent
  -- use 'xiyaowong/transparent.nvim'

  -- vscode like pictograms
 use {
    'onsails/lspkind.nvim',
    event = 'BufRead',
  }

  use {
    'elkowar/yuck.vim',
    event = 'BufRead',
  }


  -- config = { display = { open_fn = function() return require('packer.util').float({ border = single }) end } }
end)


--[[
after 
TODO
- targets.nvim
- null-ls
- mason
- nvim cmp
--]]

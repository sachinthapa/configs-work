return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  { 'junegunn/fzf', run = './install --bin', },

  -- Add git related info in the signs columns and popups
  { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } },
  -- Git commands in nvim
  { 'tpope/vim-fugitive' },
  -- Fugitive-companion to interact with github
  --use 'tpope/vim-rhubarb'

  { 'francoiscabrol/ranger.vim' },

  {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }},

  { 'projekt0n/github-nvim-theme' },

  -- Fugitive-companion to interact with github
  --use 'tpope/vim-rhubarb'
  -- Operate on an Indented Block of Lines
  {'michaeljsmith/vim-indent-object'},
  -- "gc" to comment visual regions/lines
  {'numToStr/Comment.nvim'},
  --use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- Autopair plugin for Neovim
  {'windwp/nvim-autopairs'},
  -- Automatically highlighting other uses of the word under the cursor
  {'RRethy/vim-illuminate'},
  -- Console file manager with VI key bindings.

  { 'rbgrouleff/bclose.vim' },

  {'kyazdani42/nvim-web-devicons'},
  -- Statusline written in Lua
  {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}, -- Fancier statusline
  -- A snazzy bufferline for Neovim
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  -- Delete buffers and close files in Vim without closing your windows or messing up your layout
  {'moll/vim-bbye'},
  -- Add indentation guides even on blank lines
  {'lukas-reineke/indent-blankline.nvim'},
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  -- Additional textobjects for treesitter
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  -- inject LSP diagnostics, code actions, and more via Lua
  {'nvim-lua/plenary.nvim'},

  -- Collection of configurations for built-in LSP client
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp'},
  { 'hrsh7th/cmp-path'},
  { 'hrsh7th/cmp-buffer'},
  { 'hrsh7th/cmp-cmdline'},
  { 'hrsh7th/cmp-nvim-lsp'},
  { 'jose-elias-alvarez/null-ls.nvim' },
  -- { 'saadparwaiz1/cmp_luasnip'
  -- { 'L3MON4D3/LuaSnip'
  -- { "rafamadriz/friendly-snippets"
  { 'SirVer/ultisnips' },
  { 'honza/vim-snippets'},
  { 'quangnguyen30192/cmp-nvim-ultisnips' },

  -- Extensions for the built-in Language Server Protocol
  -- support in Neovim for eclipse.jdt.ls.
  { 'mfussenegger/nvim-jdtls'}

}

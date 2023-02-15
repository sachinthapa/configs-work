-- Install packer
-- a
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.g.python3_host_prog = '/home/sachin/Envs/nvim/bin/python'
-- vim.g.UltiSnipsSnippetDirectories = "~/.config/nvim/UltiSnips"

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim' 
  -- fzf.vim, written in lua
  use 'ibhagwan/fzf-lua'
  -- Command Line fuzzy finder
  use { 'junegunn/fzf', run = './install --bin', }
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Git commands in nvim
  use 'tpope/vim-fugitive'
  -- Fugitive-companion to interact with github
  --use 'tpope/vim-rhubarb' 
  -- Operate on an Indented Block of Lines
  use 'michaeljsmith/vim-indent-object'
  -- "gc" to comment visual regions/lines
  use 'numToStr/Comment.nvim'   
  --use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- Autopair plugin for Neovim 
  use 'windwp/nvim-autopairs'
  -- Automatically highlighting other uses of the word under the cursor
  use'RRethy/vim-illuminate'
  -- Console file manager with VI key bindings.
  use 'francoiscabrol/ranger.vim'
  use 'rbgrouleff/bclose.vim'
  -- Themes
  use 'ghifarit53/tokyonight-vim'
  use 'NLKNguyen/papercolor-theme'
  --use "EdenEast/nightfox.nvim" 
  --use { "catppuccin/nvim", as = "catppuccin" }
  -- Adds file type icons to Vim plugins
  use 'kyazdani42/nvim-web-devicons'
  -- Statusline written in Lua
  use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }} -- Fancier statusline
  -- A snazzy bufferline for Neovim
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
  -- Delete buffers and close files in Vim without closing your windows or messing up your layout
  use 'moll/vim-bbye'
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- inject LSP diagnostics, code actions, and more via Lua
  use 'nvim-lua/plenary.nvim'

  -- inject LSP diagnostics, code actions, and more
  use {"jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" }}
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  -- use 'saadparwaiz1/cmp_luasnip'
  -- use 'L3MON4D3/LuaSnip' 
  -- use "rafamadriz/friendly-snippets"
  use 'SirVer/ultisnips' 
  use 'honza/vim-snippets'
  use 'quangnguyen30192/cmp-nvim-ultisnips' 

end)

local BUFFER = vim.bo
local GLOBAL = vim.o
local WINDOW = vim.wo

--Set highlight on search
vim.o.hlsearch = true 

--Make line numbers default
vim.wo.number = false

vim.wo.cursorline = false 

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true
vim.o.background= 'dark'

vim.g['ranger_map_keys'] = 0

--Set colorscheme
--vim.g['tokyonight_style'] = 'storm'
vim.cmd [[colorscheme PaperColor]]
vim.cmd [[colorscheme PaperColor]]


vim.g['lightline#bufferline#shorten_path'] =  1

-- vim.cmd[[highlight CursorLine cterm=NONE ctermbg=Cyan ctermfg=blue guibg=DarkGreen guifg=white]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'



-- tabs and space handling
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab= true
vim.opt.foldcolumn = '2'

require('key_bindings.keybindings')
require('lua_line.lualine')
require('buffer_line.bufferline')
require('nvim_cmp.nvimcmp')
require('nvim_lsp.nvimlsp')
require('comment')
require('null_ls')
require('autopairs')

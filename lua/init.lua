-- Install packer
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

vim.g.python3_host_prog = '/home/sachint/VEnvs/nvim/bin/python'

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
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' 
  use "rafamadriz/friendly-snippets"

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

--Set statusbar
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'papercolor_light',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    -- lualine_a = {},
    -- lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- commenting plugin for neovim
require('Comment').setup(
 {
    ---Add a space b/w comment and the line
    ---@type boolean|fun():boolean
    padding = true,

    ---Whether the cursor should stay at its position
    ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    ---@type boolean
    sticky = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ---@type string|fun():string
    ignore = nil,

    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = '<Leader>cc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = '<Leader>c',
        ---Block-comment keymap
        block = 'gb',
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },

    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---NOTE: If `mappings = false` then the plugin won't create any mappings
    ---@type boolean|table
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
    },

    ---Pre-hook, called before commenting the line
    ---@type fun(ctx: Ctx):string
    pre_hook = nil,

    ---Post-hook, called after commenting is done
    ---@type fun(ctx: Ctx)
    post_hook = nil,
}
)
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

--Remap space as leader key
-- vim.g.mapleader = "\\"
-- vim.g.maplocalleader = "\\"

--Bufferline 
vim.api.nvim_set_keymap('n', '<Leader>q', "<cmd>Bdelete<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>Q', "<cmd>Bwipeout<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']b', "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[b', "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

require("bufferline").setup{
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "▎",
    buffer_close_icon = '',
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --   -- remove extension from markdown files for example
    --   if buf.name:match('%.md') then
    --     return vim.fn.fnamemodify(buf.name, ':t:r')
    --   end
    -- end,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    -- end,
    offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
}


--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })


-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- nvim-autopairs setup
require('nvim-autopairs').setup{
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.]" 
}

-- For buffer words
require('cmp').setup({
  sources = {
    { name = 'buffer' },
  },
})
--For command cmp 
require'cmp'.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- illuminate Configuration
require'lspconfig'.gopls.setup {
  on_attach = function(client)
    -- [[ other on_attach code ]]
    require 'illuminate'.on_attach(client)
  end,
}
-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Ranger mapping
vim.api.nvim_set_keymap('n', '<leader>e', ':Ranger<CR>', { noremap = true, silent = true })

-- Diagnostic keymaps
vim.api.nvim_set_keymap('n', '<leader>E', '<cmd>lua vim.diagnostic.open_float()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_seq_sync()' ]]
  --vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})

end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'pyright'}
-- local servers = { 'pyright','tsserver'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("lspconfig").tsserver.setup({
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider= false
        client.server_capabilities.document_range_formatting = false
    end,
})

-- luasnip setup
require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require 'luasnip'
local lspkind = require('lsp_kind.lspkind')
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

 formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
  mapping = {
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    --['<C-p>'] = cmp.mapping.select_prev_item(),
    --['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lsp' },
  },
  experimental = {
    ghost_text =  false,
    native_menu = false,
  },  
}

-- Setup Null ls and register source 
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics
null_ls.setup({
    debug = true,
    sources = {
        -- formatting.stylua,
        -- formatting.prettier,
        -- formatting.black.with({extra_args = {"--stdin-filename","--preview"}}),
        formatting.isort,
        formatting.black.with({extra_args = {"-l","79"}}),
        -- formatting.djlint,
        -- diagnostic.djlint,
        -- diagnostic.eslint,
        diagnostic.flake8,
    },
     on_attach = function(client)
       if client.server_capabilities.document_formatting then
             vim.cmd([[
             augroup LspFormatting
                 autocmd! * <buffer>
                 autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
             augroup END
             ]])
       end
         if client.server_capabilities.document_range_formatting then
             vim.cmd("xnoremap <silent><buffer> <Space>f :lua vim.lsp.buf.range_formatting()<CR>")
         end
     end,
})

-- vim.api.nvim_set_keymap('n', '<Space>f', '<cmd>Format<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Space>f', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })


-- Key bIndings helper function
local map = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

-- Additional Key bindings
map {'n', '//', ':noh<CR>'}

-- file finder mapping
map {'n', '<Leader>f' ,"<cmd>lua require('fzf-lua').files()<CR>"}
map {'n', '<Leader>o' ,"<cmd>lua require('fzf-lua').oldfiles()<CR>"}
map {'n', '<Leader>wg' ,"<cmd>lua require('fzf-lua').grep()<CR>"}
map {'n', '<Leader>wf' ,"<cmd>lua require('fzf-lua').grep_cword()<CR>"}
map {'n', '<Leader>wF' ,"<cmd>lua require('fzf-lua').live_grep()<CR>"}


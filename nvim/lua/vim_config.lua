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

vim.g['python_highlight_all'] =  1
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

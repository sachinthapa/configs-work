vim.cmd([[set cmdheight=0]])
vim.g.python3_host_prog = '/home/sachin/Envs/nvim/bin/python'

require('gitthemes')
require('treesitter')
require("config.lazy")
require('comment')
require('vim_config')
require('key_bindings.keybindings')
require('lua_line.lualine')
require('buffer_line.bufferline')
require('nvim_cmp.nvimcmp')
require('nvim_lsp.nvimlsp')
require('autopairs')
require('null_ls')

vim.cmd.colorscheme 'github_dark_default'

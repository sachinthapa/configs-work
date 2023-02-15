
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

map {'i', ':<Leader>A','<Leader>o<CR>'}


-- file finder mapping
map {'n', '<Leader>f' ,"<cmd>lua require('fzf-lua').files()<CR>"}
map {'n', '<Leader>o' ,"<cmd>lua require('fzf-lua').oldfiles()<CR>"}
map {'n', '<Leader>wg' ,"<cmd>lua require('fzf-lua').grep()<CR>"}
map {'n', '<Leader>wf' ,"<cmd>lua require('fzf-lua').grep_cword()<CR>"}
map {'n', '<Leader>wF' ,"<cmd>lua require('fzf-lua').live_grep()<CR>"}



-- Ranger mapping
vim.api.nvim_set_keymap('n', '<leader>e', ':Ranger<CR>', { noremap = true, silent = true })

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false


-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

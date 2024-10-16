-- Setup Null ls and register source 
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics
null_ls.setup({
    debug = true,
    sources = {
        -- formatting.stylua,
        formatting.prettier,
        -- formatting.black.with({extra_args = {"--stdin-filename","--preview"}}),
        formatting.isort,
        formatting.blue.with({extra_args = {"-l","79","--preview"}}),
        -- diagnostic.pylint.with({
        --   diagnostics_postprocess = function(diagnostic)
        --     diagnostic.code = diagnostic.message_id
        --   end,
        -- }),
        diagnostic.flake8,
        -- formatting.djlint,
        -- diagnostic.djlint,
        -- diagnostic.eslint,
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

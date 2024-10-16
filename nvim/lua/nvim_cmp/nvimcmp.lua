--set completeopt=menu,menuone,noselect
vim.o.completeopt = 'menuone,noselect'
vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#404040" , fg = "White", bold = true})
-- vim.api.nvim_set_hl(0, "MyPmenu", { bg = "#212121" , fg = "#f7e6c7"})
vim.api.nvim_set_hl(0, "MyPmenu", { bg = "#212121" , fg = "#474747"})
vim.api.nvim_set_hl(0, "MyPmenuDoc", { bg = "#212121" , fg = "#474747"})

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

  -- Set up nvim-cmp.
  local lspkind = require('lsp_kind.lspkind')

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
      completion = cmp.config.window.bordered({
        border = "single",
        col_offset = -3,
        padding = 0,
        winhighlight = "Normal:MyPmenu,FloatBorder:MyPmenu,CursorLine:MyPmenuSel,Search:None",
    }),
      documentation = cmp.config.window.bordered({
        border = "single",
        col_offset = -3,
        padding = 0,
        winhighlight = "FloatBorder:MyPmenuDoc",
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
    mapping = cmp.mapping.preset.insert({
      --['<C-p>'] = cmp.mapping.select_prev_item(),
      --['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
      ),
      ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
      ),
    }),
  })

  -- require'cmp'.setup({
  --    sources = {
  --      { name = 'nvim_lsp' }, -- For lsp server 
  --      { name = 'buffer' }, -- For buffer words
  --    },
  -- })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  cmp.event:on(
      'confirm_done',
      require('nvim-autopairs.completion.cmp').on_confirm_done()
  )

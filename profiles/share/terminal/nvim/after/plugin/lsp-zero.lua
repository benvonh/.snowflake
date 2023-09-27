local function try_require(module)
    local ok, mod = pcall(require, module)

    if not ok then
        print('Failed to find ' .. module)
        return nil
    end

    return mod
end

local cmp = try_require('cmp')
local lsp = try_require('lsp-zero')
local lspkind = try_require('lspkind')
local lspconf = try_require('lspconfig')
local luasnip = try_require('luasnip')

if not (cmp and lsp and lspkind and lspconf and luasnip) then
    return
end

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 20,
            mode = 'symbol_text',
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<cr>']    = cmp.mapping.confirm(),
        ['<c-d>']   = cmp.mapping.scroll_docs(4),
        ['<c-u>']   = cmp.mapping.scroll_docs(-4),
        ['<c-p>']   = cmp.mapping.select_prev_item(select_opts),
        ['<c-n>']   = cmp.mapping.select_next_item(select_opts),
        ['<c-e>']   = cmp.mapping.abort(),
        ['<tab>']   = lsp.cmp_action().luasnip_supertab(),
        ['<s-tab>'] = lsp.cmp_action().luasnip_shift_supertab(),
        -- ['<tab>']   = cmp.mapping(
        --     function(fallback)
        --         if cmp.visible() then
        --             cmp.confirm({ select = true })
        --         elseif luasnip.expand_or_jumpable() then
        --             luasnip.expand_or_jump()
        --         else
        --             fallback()
        --         end
        --     end, { 'i', 's' }
        -- ),
        -- ['<s-tab>'] = cmp.mapping(
        --     function(fallback)
        --         if cmp.visible() then
        --             cmp.select_prev_item(select_opts)
        --         elseif luasnip.jumpable(-1) then
        --             luasnip.jump(-1)
        --         else
        --             fallback()
        --         end
        --     end, { 'i', 's' }
        -- ),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lua', keyword_length = 1 },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'nvim_lsp_signature_help' },
    }, {
        { name = 'path', keyword_length = 2 },
        { name = 'buffer', keyword_length = 2 },
        { name = 'luasnip', keyword_length = 2 },
    }),
})

cmp.setup.filetype('gitcommit', {
    sources = {
        { name = 'buffer' }
    },
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
})

lsp.preset('minimal')
lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false,
    })
end)

lsp.setup_servers({
    'clangd',
    'cmake',
    'pyright',
    'bashls',
    'rnix',
    'lua_ls',
    'jsonls',
})

lspconf.lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

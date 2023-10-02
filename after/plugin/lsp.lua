local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = {
        set_sources = 'recommended'
    }
})


lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_mapping('gq', {
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['null-ls'] = { 'go', 'yaml', 'yml' },
    }
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['gopls'] = { 'go' },
        ['lua_ls'] = { 'lua' },
        ['null-ls'] = { 'go', 'yaml', 'yml' },
    }
})

lsp.setup()

local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.yamlfix,
    }
})

-- Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- have to disable tab to work with github copilot
        -- ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})

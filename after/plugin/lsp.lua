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
        ['null-ls'] = { 'go' },
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
    }
})

lsp.setup()

local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.goimports
    }
})

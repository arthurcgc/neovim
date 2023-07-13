local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	lsp.buffer_autoformat()
	vim.keymap.set({ 'n', 'x' }, 'gq', function()
		vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
	end)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

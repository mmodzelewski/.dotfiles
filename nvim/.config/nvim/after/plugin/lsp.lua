-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.on_attach(function(client, butnr)
	local opts = {buffer = bufnr, remap = false}
end)

lsp.setup()

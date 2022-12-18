local lspconfig = require("lspconfig")
local servers = { "sumneko_lua", "rust_analyzer", "clangd" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({})
end

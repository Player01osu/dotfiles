local lspconfig = require("lspconfig")
local servers = { "rust_analyzer", "clangd" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({})
end

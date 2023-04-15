require("impatient")

require("neoconf").setup({
  -- override any of the default settings here
})

require("user.files")

require("user.catppuccino")
require("user.cmp")
require("user.commands")
require("user.indent")
require("user.keymaps")
require("user.lsp")
require("user.lualine")
require("user.luasnippets")
require("user.mason")
require("user.plugins")
require("user.treesitter")
require("user.vimwiki")

require("user.options")
vim.cmd("colorscheme colorscheme")
vim.opt_global.laststatus = 3 -- Has to be after colorscheme for some reason
require("user.jumper")
--require("user.editfile")


local links = {
  ['@lsp.type.namespace'] = '@namespace',
  ['@lsp.type.type'] = '@type',
  ['@lsp.type.class'] = '@type',
  ['@lsp.type.enum'] = '@type',
  ['@lsp.type.interface'] = '@type',
  ['@lsp.type.struct'] = '@structure',
  ['@lsp.type.parameter'] = '@parameter',
  ['@lsp.type.variable'] = '@variable',
  ['@lsp.type.property'] = '@property',
  ['@lsp.type.enumMember'] = '@constant',
  ['@lsp.type.function'] = '@function',
  ['@lsp.type.method'] = '@method',
  ['@lsp.type.macro'] = '@macro',
  ['@lsp.type.decorator'] = '@function',
}
for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end

vim.cmd([[
  if exists("g:neovide")
    lua require "user.neovide"
  endif
]])

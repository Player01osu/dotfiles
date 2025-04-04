vim.loader.enable()

require("user.lazy")
require("user.commands")
require("user.keymaps")

require("user.options")
require("user.jumper")
require("user.projects")
vim.cmd.colorscheme("colorscheme")
vim.opt_global.laststatus = 3 -- Has to be after colorscheme for some reason

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

if vim.g.neovide then
    require "user.neovide"
	--vim.o.guifont = "JetBrains Mono Nerd Font:h14"
end

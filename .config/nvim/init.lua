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
require("user.options")
require("user.plugins")
require("user.treesitter")
require("user.vimwiki")

vim.cmd("colorscheme colorscheme")
require("user.jumper")
--require("user.editfile")


vim.cmd([[
  if exists("g:neovide")
    lua require "user.neovide"
  endif
]])

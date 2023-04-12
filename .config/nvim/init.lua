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


vim.cmd([[
  if exists("g:neovide")
    lua require "user.neovide"
  endif
]])

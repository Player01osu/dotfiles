require('impatient')

require "user.catppuccino"
require "user.cmp"
require "user.commands"
require "user.indent"
require "user.keymaps"
require "user.lsp"
require "user.lualine"
require "user.mason"
require "user.options"
require "user.plugins"
require "user.treesitter"
require "user.vimwiki"

vim.cmd([[
  if exists("g:neovide")
    lua require "user.neovide"
  endif
]])


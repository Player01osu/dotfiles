require('impatient')
--require "user.bufferline"
require "user.cmp"
require "user.commands"
require "user.indent"
require "user.keymaps"
require "user.lsp"
require "user.lualine"
require "user.mason"
require "user.options"
require "user.plugins"
require "user.telescope"
require "user.treesitter"

vim.cmd([[
  if exists("g:neovide")
    lua require "user.neovide"
  endif
]])

vim.cmd([[
  function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    let link = a:link
    if link =~# '^vfile:'
      let link = link[1:]
    else
      return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
    else
      exe 'tabnew ' . fnameescape(link_infos.filename)
      return 1
    endif
  endfunction
]])

--require "user.material"
--require "user.compleet"
--require "user.nvimtree"

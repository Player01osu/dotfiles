local set = vim.opt

set.background = "dark"
set.backup = false
set.clipboard = "unnamedplus"
set.confirm = true
set.cursorline = true
set.completeopt = { "menuone", "noselect", "noinsert" }
set.expandtab = false
set.hidden = true
set.signcolumn = "yes:2"
set.incsearch = true
set.laststatus = 3
--set.mouse = "a"
set.nu = true
set.number = true
set.relativenumber = true
set.scrolloff = 13
set.shiftwidth = 8
set.sidescrolloff = 10
set.smartcase = true
set.splitbelow = true
set.tabstop = 8
set.termguicolors = true
set.wrap = false


vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20
vim.g.markdown_syntax_conceal = 0
vim.g.markdown_minlines = 98
vim.g.material_terminal_italics = 1
vim.g.material_style = "deep ocean"
vim.g.moonflyTransparent = 1
vim.g.edge_style = 'neon'
vim.g.edge_better_performance = 1
vim.g.edge_transparent_background = 1
vim.g.vimtex_view_method = 'zathura'


vim.cmd([[
  set laststatus=3
  highlight CocFloating ctermbg=1 guibg=Black
  highlight CocErrorFloat ctermfg=1 guibg=Black
  highlight Pmenu ctermfg=1 guibg=Black
  highlight Todo ctermfg=0 guibg=None guifg=#de935f
  highlight WinSeperator guibg=None
  colorscheme edge
  let g:vimwiki_list = [{'path':'~/Documents/wiki', 'path_html':'~/Documents/wiki_html/'}]
  set shell=/bin/dash
  ]])
-- autocmd
vim.cmd([[
  file
  autocmd FileType latex,tex,md,vimwiki,wiki,markdown set tabstop=4 softtabstop=4 shiftwidth=4 nonumber norelativenumber nocursorline signcolumn=yes:1
  autocmd FileType latex,tex,md,vimwiki,wiki,markdown map j gj
  autocmd FileType latex,tex,md,vimwiki,wiki,markdown map k gk
  autocmd FileType latex,tex TSDisable highlight
  autocmd BufRead * autocmd FileType <buffer> ++once
  \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif

  " Close Netrw if it's the only buffer open
  "autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "NvimTree" || &buftype == 'quickfix' |bd|endif

  "format on save
  autocmd BufWritePre * %s/\s\+$//e
  "autocmd BufWritePre * :Neoformat
  autocmd BufWritePost todo.wiki silent !kill -46 "$(pidof "${STATUSBAR:-dwmblocks}")"
  " command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
]])

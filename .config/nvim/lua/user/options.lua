local set = vim.opt

set.background = "dark"
set.backup = false
set.clipboard = "unnamedplus"
set.cursorline = true
set.completeopt = { "menuone", "noselect", "noinsert" }
set.expandtab = true
set.incsearch = true
set.laststatus = 3
set.mouse = "a"
set.nu = true
set.number = true
set.relativenumber = true
set.scrolloff = 13
set.shiftwidth = 2
set.sidescrolloff = 10
set.smartcase = true
set.splitbelow = true
set.tabstop = 2
set.termguicolors = true
set.wrap = false
--set.noerrorbells = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 23
--vim.g.markdown_fenced_languages = ['html', 'python', 'bash=sh', 'markdown', 'vimwiki']
vim.g.markdown_syntax_conceal = 0
vim.g.markdown_minlines = 98
vim.g.material_terminal_italics = 1
vim.g.material_style = "deep ocean"


vim.cmd([[
  colorscheme material
  highlight CocFloating ctermbg=1 guibg=Black
  highlight CocErrorFloat ctermfg=1 guibg=Black
  highlight Pmenu ctermfg=1 guibg=Black
  "command! -nargs=0 Prettier :CocCommand prettier.formatFile
  "autocmd FileType md,vimwiki :CocDisable
  highlight WinSeperator guibg=None

  "let g:neoformat_cpp_clangformat = {
  "    \ 'exe': 'clang-format',
  "    \ 'args': ['--style="{IndentWidth: 2}"']
  "\}
  "let g:neoformat_enabled_cpp = ['clangformat']
  "let g:neoformat_enabled_c = ['clangformat']
  ]])

-- autocmd
vim.cmd([[
  autocmd FileType md,vimwiki,wiki set tabstop=4 softtabstop=4 shiftwidth=4 nonumber norelativenumber nocursorline
  autocmd FileType md,vimwiki,wiki map j gj
  autocmd FileType md,vimwiki,wiki map k gk
  autocmd FileType md,vimwiki,wiki CocDisable

  " Close Netrw if it's the only buffer open
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

  "format on save
  autocmd BufWritePre * %s/\s\+$//e
  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
  " autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
  " autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 200)
  " autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync(nil, 200)
  " autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 200)
  " autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 200)
  " autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 200)
  " autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 200)
  " autocmd BufWritePre *.java lua vim.lsp.buf.formatting_sync(nil, 200)

]])

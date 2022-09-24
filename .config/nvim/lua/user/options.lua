local set = vim.opt -- Helper binding

-- Functionality --
--set.clipboard = "unnamedplus" -- Global clipboard
set.clipboard = ""
set.completeopt = { "menuone", "noselect", "noinsert" }
set.confirm = true
set.expandtab = false
set.hidden = true
set.incsearch = true
set.mouse = "nv"
set.scrolloff = 10
set.sidescrolloff = 10

-- Appearance --
set.background = "dark"
set.cursorline = true
set.guicursor = ""
set.hlsearch = false
set.laststatus = 3
set.linebreak = true
set.nu = true
set.number = true
set.relativenumber = true
set.shiftwidth = 8
set.signcolumn = "yes:2"
set.smartcase = true
set.splitbelow = true
set.tabstop = 8
set.termguicolors = true
set.wrap = true

-- Files --
set.backup = false
set.swapfile = false
set.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
set.undofile = true
set.updatetime = 60

--[[
--vim.g.netrw_liststyle = 3
--vim.g.netrw_winsize = 20
--vim.g.markdown_minlines = 98
--vim.g.material_terminal_italics = 1
--vim.g.material_style = "deep ocean"
--vim.g.moonflyTransparent = 1
--]]

-- Variables --
vim.g.edge_better_performance = 1
vim.g.edge_style = 'neon'
vim.g.edge_transparent_background = 1
vim.g.markdown_syntax_conceal = 0
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_menu = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.vimtex_view_method = 'zathura'

-- Autocommands --
local on_text_file = function()
	vim.opt.cursorline = false
	vim.opt.number = false
	vim.opt.relativenumber = false
	vim.opt.shiftwidth = 4
	vim.opt.signcolumn = "yes:1"
	vim.opt.softtabstop = 4
	vim.opt.tabstop = 4
	vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
	vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
end

--local on_rust_file = function()
--	require('rust-tools').setup({})
--end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.latex", "*.tex", "*.txt", "*.md", "*.markdown", "*.wiki" },
	callback = function() on_text_file() end,
})

--vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--	pattern = { "*.rs", "*.rust", "Cargo.toml" },
--	callback = function() on_rust_file() end,
--})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = "exe 'norm m0'|%s/\\s\\+$//e |norm!`0",
})

vim.cmd([[
  file
  autocmd BufWritePost todo.wiki silent !kill -46 $(pidof ${STATUSBAR:-dwmblocks})
]])

-- Vimscript --
vim.api.nvim_command("colorscheme edge")
vim.cmd([[
  highlight CocErrorFloat ctermfg=1 guibg=Black
  highlight CocFloating ctermbg=1 guibg=Black
  highlight Todo ctermfg=0 guibg=None guifg=#de935f
  highlight WinSeperator guibg=None
  let g:vimwiki_list = [{'path':'~/Documents/wiki', 'path_html':'~/Documents/wiki_html/'}]
  set laststatus=3
  set shell=/bin/dash
  autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  "highlight Pmenu ctermfg=1 guibg=Black
  ]])

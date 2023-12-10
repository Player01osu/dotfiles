local set = vim.opt -- Helper binding

-- Functionality --
set.clipboard = ""
set.complete = {".","w","b","u","t","i","kspell"}
set.completeopt = { "preview", "menuone", "noselect", "noinsert" }
set.confirm = true
set.expandtab = true
--set.grepprg = "grep -Irn $*" -- No ripgrep
set.grepprg = "grep $*" -- No ripgrep
--set.grepprg = "rg -rn $*"
set.hidden = true
set.incsearch = true
set.path = "**"
set.mouse = "nv"
set.scrolloff = 4
set.shell = "/bin/dash"
set.sidescrolloff = 12
set.smoothscroll = true

-- Appearance --
set.background = "dark"
set.conceallevel = 0
set.cursorline = true
set.guicursor = ""
set.hlsearch = false
set.linebreak = true
set.nu = true
set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.showtabline = 0
set.signcolumn = "yes:2"
set.smartcase = true
set.splitbelow = false
set.tabstop = 4
set.termguicolors = true
set.wrap = true


-- Files --
set.backup = false
set.swapfile = false
set.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
set.undofile = true
set.updatetime = 60

--[[
--vim.g.netrw_winsize             = 20
--vim.g.markdown_minlines         = 98
--vim.g.material_terminal_italics = 1
--vim.g.material_style            = "deep ocean"
--vim.g.moonflyTransparent        = 1
--]]
-- Globals --
vim.g.edge_better_performance       = 1
vim.g.edge_style                    = "neon"
vim.g.edge_transparent_background   = 1
vim.g.markdown_syntax_conceal       = 0
vim.g.netrw_banner                  = 0
vim.g.netrw_browse_split            = 0
vim.g.netrw_menu                    = 0
vim.g.netrw_keepdir                 = 1
vim.g.netrw_keepj                   = ""
vim.g.netrw_sizestyle               = "H"
vim.g.netrw_sort_by                 = "exten"
vim.g.netrw_localcopydircmd         = "cp -r"
vim.g.netrw_localrmdir              = "rm -r"
vim.g.netrw_list_hide               = [[^\.\.\/ .*,^\.\/ .*0.*,^\.\/$,^\.\.\/$]]
vim.g.loaded_python3_provider       = 0

--vim.g.netrw_list_cmd = "ls"

--vim.g.netrw_maxfilenamelen          = 80
vim.g.netrw_dynamic_maxfilenamelen  = 100
vim.g.netrw_liststyle               = 1
vim.g.vimtex_view_method            = "zathura"
vim.g.vim_markdown_folding_disabled = 1

-- File Specific --

-- Autocommands --
local on_text_file                  = function()
	vim.opt_local.signcolumn = "yes:1"
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.latex", "*.tex", "*.txt", "*.md", "*.markdown", "*.wiki" },
	callback = function()
		on_text_file()
	end,
})

-- Removes whitespace from end of lines.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = "exe 'norm m0'|%s/\\s\\+$//e |norm!`0",
})

-- Return to same spot in file after reopen.
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	command =
	[[if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
})

-- Autocomands for todo list
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "todo.wiki" },
	callback = function()
		os.execute("kill -46 $(pidof ${STATUSBAR:-dwmblocks})")
		os.execute("pkill -SIGRTMIN+8 waybar")
		os.execute("todo-backup")
		os.execute("curl http://216.128.178.18/api/v1 -s > /home/bruh/Documents/wiki/todo.wiki")
		vim.cmd("e!")
		vim.opt_local.cursorline = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "yes:1"
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "FocusLost" }, {
	pattern = { "todo.wiki" },
	callback = function()
		if not vim.opt.modified._value then
			os.execute("todo-backup")
			os.execute("curl http://216.128.178.18/api/v1 -s > /home/bruh/Documents/wiki/todo.wiki")
			vim.cmd("e!")
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "todo.wiki" },
	callback = function()
		os.execute("kill -46 $(pidof ${STATUSBAR:-dwmblocks})")
		os.execute("pkill -SIGRTMIN+8 waybar")
		os.execute("curl --data-binary @/home/bruh/Documents/wiki/todo.wiki --request POST http://216.128.178.18/api/v1 &")
	end,
})

-- Vimscript --
vim.cmd([[
  let g:vimwiki_list = [{'path':'~/Documents/wiki', 'path_html':'~/Documents/wiki_html/'}]
  ]])

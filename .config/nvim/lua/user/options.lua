local set = vim.opt -- Helper binding

-- Behavior --
set.clipboard     = ""
set.complete      = {".","w","b","u","t","i","kspell"}
set.completeopt   = { "preview", "menuone", "noselect", "noinsert" }
set.confirm       = true
set.expandtab     = true
set.grepprg       = "grep $*"        -- No ripgrep
set.grepformat    = "%f:%l:%m"    -- Default acts with assumption that `rg` is used
set.hidden        = true
set.incsearch     = true
set.path          = ".,/usr/include,/usr/local/include"
set.mouse         = "nv"
set.scrolloff     = 4
set.shell         = "/bin/dash"
set.sidescrolloff = 12
set.smoothscroll  = true

--set.autoindent = true
--set.smartindent = false
--set.cindent = false
--vim.cmd.set('indentexpr=nvim_treesitter#indent()')

-- Appearance --
set.background     = "dark"
set.conceallevel   = 0
set.cursorline     = true
set.guicursor      = ""
set.hlsearch       = false
set.linebreak      = true
set.nu             = true
set.relativenumber = true
set.shiftwidth     = 4
set.showtabline    = 0
set.signcolumn     = "yes:2"
set.smartcase      = true
set.splitbelow     = false
set.tabstop        = 4
set.termguicolors  = true
set.wrap           = true

vim.opt.list      = true
vim.opt.listchars = {
	tab   = "⟩ ",
	trail = "+",
	space = "·",
	nbsp  = "␣",
}

-- Disable comment continuation on newline
vim.cmd("au FileType * set fo-=c fo-=r fo-=o")

-- Files --
set.backup     = false
set.swapfile   = false
set.undodir    = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
set.undofile   = true
set.updatetime = 60

-- Globals --
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
vim.g.netrw_dynamic_maxfilenamelen  = 100
vim.g.netrw_liststyle               = 1
vim.g.vimtex_view_method            = "zathura"
vim.g.vim_markdown_folding_disabled = 1

-- File Specific --

-- Autocommands --
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.latex", "*.tex", "*.txt", "*.md", "*.markdown", "*.wiki" },
	callback = function()
		vim.opt_local.signcolumn = "yes:1"
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

local function buf_modified()
	return vim.opt.modified._value
end

local enable_todo_server = false

local function has_connection()
	--return os.execute("wget -q --spider http://216.128.178.18/api/v1") == 0
	return false
end

-- Autocomands for todo list
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "todo.wiki" },
	callback = function()
		local Job = require'plenary.job'
		vim.opt_local.cursorline = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "yes:1"

		Job:new({
			command = "todo-backup",
			detached = true,
			skip_validation = true,
		}):start()

		if enable_todo_server then
			if not buf_modified() and has_connection() then
				os.execute("kill -46 $(pidof ${STATUSBAR:-dwmblocks})")
				os.execute("pkill -SIGRTMIN+8 waybar")
				os.execute("curl http://216.128.178.18/api/v1 -s > /home/bruh/Documents/wiki/todo.wiki")
				vim.cmd("e!")
			end
		end
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "FocusLost" }, {
	pattern = { "todo.wiki" },
	callback = function()
		os.execute("todo-backup")
		if enable_todo_server then
			if not buf_modified() and has_connection() then
				os.execute("curl http://216.128.178.18/api/v1 -s > /home/bruh/Documents/wiki/todo.wiki")
				vim.cmd("e!")
			end
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "todo.txt", "todo.wiki" },
	callback = function()
		if os.getenv("XDG_SESSION_TYPE") == "wayland" then
			os.execute("pkill -SIGRTMIN+1 waybar")
		else
			os.execute("kill -46 $(pidof ${STATUSBAR:-dwmblocks})")
		end

		if enable_todo_server and has_connection() then
			local Job = require'plenary.job'
			Job:new({
				command = "curl",
				args = { "--data-binary", "@/home/bruh/Documents/wiki/todo.wiki", "--request", "POST", "http://216.128.178.18/api/v1" },
				detached = true,
				skip_validation = true,
			}):start() -- or sync()
		end
	end,
})

-- Vimscript --
vim.cmd([[
  let g:vimwiki_list = [{'path':'~/Documents/wiki', 'path_html':'~/Documents/wiki_html/'}]
]])

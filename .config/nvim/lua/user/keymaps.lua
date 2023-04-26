local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Leader Key
vim.g.mapleader = " "

-- Normal --
keymap("n", "<C-H>", ":bd<CR>", opts)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

vim.keymap.set("n", "<C-N>", function()
	vim.cmd("Ex");
end, opts)

vim.keymap.set("n", "<leader>cn", function()
	vim.cmd("cn");
end, opts)

vim.keymap.set("n", "<leader>cp", function()
	vim.cmd("cp");
end, opts)


vim.keymap.set("n", "<leader>gq1", function()
	vim.opt.textwidth = 100
	vim.cmd("norm gqj")
	vim.opt.textwidth = 0
end, opts)
vim.keymap.set("n", "<leader>gq8", function()
	vim.opt.textwidth = 80
	vim.cmd("norm gqj")
	vim.opt.textwidth = 0
end, opts)

vim.keymap.set("n", "<leader>cj", function()
	if cmd_bid == nil or vim.fn.bufexists(cmd_bid) == 0 then
		vim.cmd("term zsh")
		vim.cmd("startinsert")
		cmd_bid = vim.fn.bufnr()

		vim.g.cid = cmd_bid
		return
	end
	vim.cmd("b " .. cmd_bid)
	vim.cmd("startinsert")
end, opts)

keymap("n", "<leader>li", ":LspStart<CR>", opts)
keymap("n", "<leader>lo", ":LspStop<CR>", opts)

keymap("n", "<leader>con", ":e ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<leader>so", ":so ~/.config/nvim/init.lua<CR>", opts)

keymap("n", "<leader>sf", ":Neoformat<CR> :w<CR>", opts)

vim.keymap.set("n", "<leader><leader>cd", function()
	local cur_dir = vim.fn.expand("%:p:h") .. "/"

	vim.cmd("cd " .. cur_dir)
end, opts)

vim.keymap.set("n", "<leader><leader>ef", function()
	local cur_dir = vim.fn.expand("%:p")
	local fname = vim.fn.input("File: ", cur_dir, "file")
	if cur_dir == fname or fname == "" or fname == nil then
		return
	end


	--[[ -- Replaced in favor of `:w ++p`
		 --
		 -- `:help :write` for more information
	-- Create directories as needed
	local utils = require("user.utils")
	if not utils.exists(fname) then
		local dirs = utils.split_string(fname, "/")
		local build = ""
		for idx, v in pairs(dirs) do
			if idx > #dirs - 1 then
				break
			end

			build = build .. "/" .. v
			if not utils.isdir(build) then
				os.execute("mkdir -p " .. build)
			end
		end
	end
	]]--

	vim.cmd("e " .. fname)
end, opts)

vim.keymap.set("n", "<leader>ef", function()
	local cur_dir = vim.fn.expand("%:p:h") .. "/"
	local fname = vim.fn.input("File: ", cur_dir, "file")
	if cur_dir == fname or fname == "" or fname == nil then
		return
	end

	-- Create directories as needed
	local utils = require("user.utils")
	if not utils.exists(fname) then
		local dirs = utils.split_string(fname, "/")
		local build = ""
		for idx, v in pairs(dirs) do
			if idx > #dirs - 1 then
				break
			end

			build = build .. "/" .. v
			if not utils.isdir(build) then
				os.execute("mkdir -p " .. build)
			end
		end
	end

	vim.cmd("e " .. fname)
end, opts)

vim.keymap.set("n", "<leader>eb", function()
	local cur_buf = vim.fn.expand("%")
	local fname = vim.fn.input("Buffer: ", "", "buffer")
	if cur_buf == fname or fname == "" then
		return
	end

	vim.cmd("b " .. fname)
end, opts)

vim.keymap.set("n", "<leader><leader>eb", function()
	local cur_buf = vim.fn.expand("%")
	vim.cmd([[ls]])
	vim.cmd([[ls %a]])

	local fname = vim.fn.input("Buffer: ", "", "buffer")
	if cur_buf == fname or fname == "" then
		return
	end

	vim.cmd("b " .. fname)
end, opts)


-- This lowkey sucks
vim.cmd([[
fun OldFiles(A,L,P)
return v:lua.require("user.utils").oldfiles(0,0,0)
endfun
]])

vim.keymap.set("n", "<leader>eo", function()
	local cur_file = vim.fn.expand("%:p")
	local fname = vim.fn.input("Old File: ", "", "custom,OldFiles")

	if cur_file == fname or fname == "" or fname == nil then
		return
	end

	vim.cmd("e " .. fname);
end)

vim.keymap.set("n", "<leader><leader>cb", function()
	vim.cmd([[ls]])
	vim.cmd([[ls %a]])
	local fname = vim.fn.input("Close Buffer: ", "", "buffer")

	if fname == "" or fname == nil then
		return
	end

	vim.cmd("bd " .. fname)
end, opts)

vim.keymap.set("n", "<leader>cb", function()
	local fname = vim.fn.input("Close Buffer: ", "", "buffer")

	if fname == "" or fname == nil then
		return
	end

	vim.cmd("bd " .. fname)
end, opts)

vim.keymap.set("n", "<leader><leader>sr", function()
	local run = vim.g.run

	if vim.g.run == nil then
		run = ""
	end

	local run_new = vim.fn.input("Run command: ", run, "file")

	if run_new == "" then
		return
	end

	vim.opt.makeprg = run_new
	vim.g.run = run_new

	vim.cmd("w | make!");
end, opts)

vim.keymap.set("n", "<leader>sr", function()
	local run = vim.g.run

	if vim.g.run == nil then
		run = ""
	end

	local run_new = vim.fn.input("Run command: ", run, "file")

	if run_new == "" then
		return
	end

	vim.opt.makeprg = run_new
	vim.g.run = run_new
end, opts)

keymap("n", "<leader>yaa", ":%y+<CR>", opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+y$', opts)

keymap("n", "<leader>d", '"+d', opts)
keymap("n", "<leader>D", '"+D', opts)

keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<leader>P", '"+P', opts)

keymap("n", "<leader>A", "zzA", opts)
keymap("n", "<leader>I", "zzI", opts)
keymap("n", "<leader>a", "zza", opts)
keymap("n", "<leader>i", "zzi", opts)
keymap("n", "<leader>gg", ":tab G<CR>", opts)
keymap("n", "<leader>H", ":set signcolumn=yes:9<CR>", opts)
keymap("n", "<leader>J", ":set signcolumn=yes:2<CR>", opts)

keymap("n", "<M-.>", ":vert resize +1<CR>", opts)
keymap("n", "<M-,>", ":vert resize -1<CR>", opts)

keymap("n", "<M->>", ":resize +1<CR>", opts)
keymap("n", "<M-lt>", ":resize -1<CR>", opts)

vim.keymap.set("n", "<leader>ll", function()
	vim.opt_local.wrap = false
end, opts)

vim.keymap.set("n", "<leader>lk", function()
	vim.opt_local.wrap = true
end, opts)

vim.keymap.set("n", "<leader>sd", function()
	local fname = vim.fn.input("File: ", "~/Documents/dump/", "file")
	vim.cmd("w " .. fname)
	vim.cmd("e " .. fname)
end, opts)
vim.keymap.set("n", "<leader>tmp", function()
	local charset = {}
	do -- [0-9a-zA-Z]
		for c = 48, 57 do
			table.insert(charset, string.char(c))
		end
		for c = 65, 90 do
			table.insert(charset, string.char(c))
		end
		for c = 97, 122 do
			table.insert(charset, string.char(c))
		end
	end

	local function randomString(length)
		if not length or length <= 0 then
			return ""
		end
		math.randomseed(os.clock() ^ 5)
		return randomString(length - 1) .. charset[math.random(1, #charset)]
	end

	local cmd = "e /tmp/tmp-" .. randomString(15) .. ".txt"
	vim.cmd(cmd)
end, opts)

vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, opts)

vim.keymap.set("n", "<leader>fr", function()
	require("telescope.builtin").lsp_references()
end, opts)

vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, opts)

vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, opts)

vim.keymap.set("n", "<leader>fn", function()
	require("telescope.builtin").help_tags()
end, opts)

vim.keymap.set("n", "<leader>fo", function()
	require("telescope.builtin").oldfiles()
end, opts)

vim.keymap.set("n", "<leader><leader>am", function()
	require("user.jumper").add_jump_under_cursor()
end, opts)

vim.keymap.set("n", "<leader><leader>gm", function()
	require("user.jumper").goto_jump_file()
end, opts)

-- insert mode
--keymap("i", "<C-P>", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", opts)
keymap("i", "<C-G><C-H>", "<Esc>i", opts)
keymap("i", "<C-G><C-L>", "<Esc>lli", opts)
keymap("i", "<C-G><C-B>", "<Esc>lbi", opts)
keymap("i", "<C-G><C-W>", "<Esc>lwi", opts)

--keymap("i", "<C-J>", "<Esc>", opts)
--keymap("s", "<C-J>", "<Esc>", opts)

vim.keymap.set("i", "<C-E>", function()
	vim.cmd("exe \"normal \\<c-e>\"");
end, opts)

vim.keymap.set("i", "<C-Y>", function()
	vim.cmd("exe \"normal \\<c-y>\"");
end, opts)

-- visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("v", "<C-J>", "<Esc>", opts)

keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>Y", '"+Y', opts)
keymap("v", "<leader>d", '"+d', opts)
keymap("v", "<leader>p", '"+p', opts)

keymap("v", "<leader>kal", "!kalker<CR>", opts)
keymap("v", "<leader>lal", "!sbcl --noinform<CR>", opts)
keymap("v", "<leader>Kal", "<Esc>`>a<CR><Esc>`<i<CR><Esc>!!kalker<CR>kJJ", opts)
--keymap("v", "<leader>kal", "!kalker<cr>", opts)
keymap("v", "<leader>wcw", "!wc -w<cr>", opts)
keymap("v", "<leader>wcc", "!wc -m<cr>", opts)

-- term mode
keymap("t", "<C-J>", "<C-\\><C-N>", opts)

-- Luasnips
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-r>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, opts)

vim.keymap.set({ "i", "s" }, "<c-t>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, opts)

vim.keymap.set("n", "<leader><leader>ss", ":source ~/.config/nvim/lua/user/luasnippets.lua<cr>", opts)
vim.keymap.set("n", "<leader><leader>se", ":e ~/.config/nvim/lua/user/luasnippets.lua<cr>", opts)

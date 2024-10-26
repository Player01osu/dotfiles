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
vim.g.mapleader = ","

-- Normal --
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

vim.keymap.set("n", "<C-N>", function()
	vim.cmd("Oil");
end, opts)

keymap("n", "<leader>con", ":e ~/.config/nvim/init.lua<CR>", opts)

vim.keymap.set("n", "<leader><leader>ef", function()
	local cur_dir = vim.fn.expand("%:p")
	local fname = vim.fn.input("File: ", cur_dir, "file")
	if cur_dir == fname or fname == "" or fname == nil then
		return
	end

	vim.cmd("e " .. fname)
end, opts)

vim.keymap.set("n", "<leader>ef", function()
	local cur_dir = vim.fn.expand("%:p:h") .. "/"
	local fname = vim.fn.input("File: ", cur_dir, "file")
	if cur_dir == fname or fname == "" or fname == nil then
		return
	end

	vim.cmd("e " .. fname)
end, opts)

vim.keymap.set("n", "<leader><leader>sr", function()
	local run = vim.g.run

	if vim.g.run == nil then
		run = ""
	end

	local run_new = vim.fn.input("Run command: ", run, "shellcmd")

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

	local run_new = vim.fn.input("Run command: ", run, "shellcmd")

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

vim.keymap.set("n", "<leader>gg", function()
	vim.cmd.G()
	vim.cmd.only()
end, opts)

keymap("n", "<leader>H", ":set signcolumn=yes:9<CR>", opts)
keymap("n", "<leader>J", ":set signcolumn=yes:2<CR>", opts)

keymap("n", "<M-.>", ":vert resize +1<CR>", opts)
keymap("n", "<M-,>", ":vert resize -1<CR>", opts)

keymap("n", "<M->>", ":resize +1<CR>", opts)
keymap("n", "<M-lt>", ":resize -1<CR>", opts)

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

vim.keymap.set("n", "<leader><leader>rm", function()
	require("user.jumper").goto_latest_jump()
end, opts)

vim.keymap.set("n", "<A-a>", function()
	vim.cmd.norm("mT");
	print("Mark added")
end, opts)

vim.keymap.set("n", "<A-m>", function()
	vim.cmd.norm("`T");
end, opts)

vim.keymap.set("n", "<A-d>", function()
	require("user.jumper").remove_latest_jump()
end, opts)

vim.keymap.set("n", "<A-f>", function()
	require("user.jumper").goto_jump_file()
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
keymap("v", "<leader>wcw", "!wc -w<cr>", opts)
keymap("v", "<leader>wcc", "!wc -m<cr>", opts)

-- Luasnips
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-r>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, opts)

vim.keymap.set({ "i", "s" }, "<c-e>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, opts)

vim.keymap.set("n", "<leader><leader>ss", ":source ~/.config/nvim/lua/user/luasnippets.lua<cr>", opts)
vim.keymap.set("n", "<leader><leader>se", ":e ~/.config/nvim/lua/user/luasnippets.lua<cr>", opts)

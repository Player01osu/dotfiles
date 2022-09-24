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
keymap("n", "<C-L>", ":set wrap<CR>", opts)
keymap("n", "<C-N>", ":Ex<CR>", opts)
keymap("n", "<C-P>", ":set nowrap<CR>", opts)
keymap("n", "<C-X>", ":noh<CR>", opts)

keymap("n", "<leader>li", ":LspStart<CR>", opts)
keymap("n", "<leader>lo", ":LspStop<CR>", opts)

keymap("n", "<leader>con", ":e ~/.config/nvim/init.lua<CR>", opts)

keymap("n", "<leader>s", ":Neoformat<CR> :w<CR>", opts)

keymap("n", "<leader>ya", ":%y+<CR>", opts)
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)

keymap("n", "<leader>d", "\"+d", opts)
keymap("n", "<leader>D", "\"+D", opts)

keymap("n", "<leader>p", "\"+p", opts)
keymap("n", "<leader>P", "\"+P", opts)

keymap("n", "<leader>A", "zzA", opts)
keymap("n", "<leader>I", "zzI", opts)
keymap("n", "<leader>a", "zza", opts)
keymap("n", "<leader>i", "zzi", opts)
keymap("n", "<leader>gg", ":LazyGit<CR>", opts)
keymap("n", "<leader>H", ":set signcolumn=yes:9<CR>", opts)
keymap("n", "<leader>J", ":set signcolumn=yes:2<CR>", opts)

keymap("n", "<leader>h", ":bp<CR>", opts)
keymap("n", "<leader>l", ":bn<CR>", opts)

vim.keymap.set(
	'n',
	'<leader>ff',
	function()
		require('telescope.builtin').find_files()
	end,
	opts
)

vim.keymap.set(
	'n',
	'<leader>fg',
	function()
		require('telescope.builtin').live_grep()
	end,
	opts
)

vim.keymap.set(
	'n',
	'<leader>fb',
	function()
		require('telescope.builtin').buffers()
	end,
	opts
)

vim.keymap.set(
	'n',
	'<leader>fn',
	function()
		require('telescope.builtin').help_tags()
	end,
	opts
)

vim.keymap.set(
	'n',
	'<leader>fo',
	function()
		require('telescope.builtin').oldfiles()
	end,
	opts
)



-- Switch and delete git worktrees
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion
vim.keymap.set(
	'n',
	'<leader>fs',
	function()
		require('telescope').extensions.git_worktree.git_worktrees()
	end,
	opts
)

-- Create new git worktree
vim.keymap.set(
	'n',
	'<leader>fc',
	function()
		require('telescope').extensions.git_worktree.create_git_worktree()
	end,
	opts
)

-- insert mode
keymap("i", "<C-P>", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", opts)

keymap("i", "<C-J>", "<Esc>", opts)

-- visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("v", "<leader>y", "\"+y", opts)

keymap("v", "<leader>d", "\"+d", opts)

keymap("v", "<leader>p", "\"+p", opts)

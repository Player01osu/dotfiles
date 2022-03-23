local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",


-- Normal --

keymap("n", "<C-B>", ":Lexplore<CR>", opts)
keymap("n", "<C-H>", ":Goyo<CR>", opts)
--keymap("n", "<C-K>", ":CocEnable<CR>", opts)
--keymap("n", "<C-J>", ":CocDisable<CR>", opts)
keymap("n", "<C-N>", ":sp<CR>:resize 8<CR>:term<CR>i", opts)
keymap("n", "<C-L>", ":set wrap<CR>", opts)
keymap("n", "<C-P>", ":set nowrap<CR>", opts)
keymap("n", "<C-X>", ":noh<CR>", opts)
keymap("n", "<C-S>", ":foldclose<CR>", opts)
keymap("n", "<C-Q>", ":foldopen<CR>", opts)
keymap("n", "<leader>a", "zza", opts)
keymap("n", "<leader>A", "zzA", opts)
keymap("n", "<leader>i", "zzi", opts)
keymap("n", "<leader>I", "zzI", opts)

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fn", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)

-- insert mode

keymap("i", "<C-P>", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", opts)

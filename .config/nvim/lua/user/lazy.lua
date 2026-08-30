local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"preservim/vim-markdown",
		ft = { "md", "markdown" }, -- Markdown folding and indent
		enabled = false,
	},
	{
		"godlygeek/tabular",
		cmd = "Tabularize",
	},

	-- Telescope --
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
			})
		end,
	},

	"nvim-lua/popup.nvim",

	"nvim-lua/plenary.nvim",

	-- Git --
	{
		"tpope/vim-fugitive",
		cmd = {"G", "Gw"},
	},

	{
		"kyazdani42/nvim-web-devicons",
		lazy = true,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		enabled = true,
		build = ":TSUpdate",
		config = function ()
			vim.api.nvim_create_autocmd('FileType', {
				pattern = { 'c', 'yaml' },
				callback = function()
					-- syntax highlighting, provided by Neovim
					vim.treesitter.start()
				end,
			})
			vim.api.nvim_create_autocmd('FileType', {
				pattern = { 'rust', 'python', 'cpp', 'haskell', 'cs', 'lisp' },
				callback = function()
					-- syntax highlighting, provided by Neovim
					vim.treesitter.start()
					-- folds, provided by Neovim
					-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
					-- vim.wo.foldmethod = 'expr'
					-- indentation, provided by nvim-treesitter
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end
	},

	{
		"stevearc/oil.nvim",
		lazy = false,
		enabled = true,
		config = function ()
			local permission_hlgroups = {
				['-'] = 'NonText',
				['r'] = 'DiagnosticSignWarn',
				['w'] = 'DiagnosticSignError',
				['x'] = 'DiagnosticSignOk',
			}

			require("oil").setup({
				default_file_explorer = true,
				cleanup_delay_ms = 1000,
				columns = {
					{
						'permissions',
						highlight = function(permission_str)
							local hls = {}
							for i = 1, #permission_str do
								local char = permission_str:sub(i, i)
								table.insert(hls, { permission_hlgroups[char], i - 1, i })
							end
							return hls
						end,
					},
					{ 'size', highlight = "Constant" },
					{ "mtime", highlight = "Special" },
				},
				view_options = {
					show_hidden = true,
					is_always_hidden = function(name, _)
						return name == ".." or name == "."
					end,
				},
				constrain_cursor = "name",
				keymaps = {
					["gX"] = {
						callback = function()
							local oil = require("oil")
							local file = oil.get_cursor_entry().name
							local dir = oil.get_current_dir()

							vim.cmd(string.format("!%s/%s", dir, file))
						end,
						desc = "Spawns file in shell"
					},
					["gp"] = {
						callback = function()
							local oil = require("oil")
							local file = oil.get_cursor_entry().name
							local dir = oil.get_current_dir()
							local path = string.format("%s/%s", dir, file)

							local permission = vim.fn.input("Set permission: ")
							if permission == nil or permission == "" then
								return
							end

							os.execute(string.format("chmod %s '%s'", permission, path))
						end
					},
					["gC"] = {
						callback = function()
							require("oil").set_sort({ { "ctime", "asc" }})
						end
					},
					["gv"] = {
						callback = function()
							require("oil").set_sort({ { "ctime", "desc" }})
						end
					},
					["gM"] = {
						callback = function()
							require("oil").set_sort({ { "mtime", "asc" }})
						end
					},
					["gm"] = {
						callback = function()
							require("oil").set_sort({ { "mtime", "desc" }})
						end
					}
				},
			})
		end
	},

	{
		"rktjmp/lush.nvim",
		cmd = "Shipwrite",
		requires = { "rktjmp/shipwright.nvim" }
	},

	{
		"nvim-treesitter/playground",
		enabled = true,
		cmd = "TSPlaygroundToggle",
	},
})

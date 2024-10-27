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
		"vimwiki/vimwiki",
		branch = "dev",
		ft = { "vimwiki" },
		config = function()
			vim.g["vimwiki_global_ext"] = 0
		end,
	},
	{
		"preservim/vim-markdown",
		ft = { "md", "markdown" }, -- Markdown folding and indent
	},
	{
		"godlygeek/tabular",
		cmd = "Tabularize",
	},

	-- Snippets --
	{
		"L3MON4D3/LuaSnip", --snippet engine
		lazy = true,
	},

	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Telescope --
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
	},

	"nvim-lua/popup.nvim",

	"nvim-lua/plenary.nvim",

	{
		"vhyrro/luarocks.nvim",
		opts = {
			luarocks_build_args = {
				"--with-lua-include=/usr/include",
			},
		},
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		enabled = false,
	},

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
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "haskell", "rust"},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
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
		cmd = "TSPlaygroundToggle",
	},
})

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

	-- Telescope --
	{
		"nvim-telescope/telescope.nvim",
		-- lazy = true,
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
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"asm",
					"rust",
					"haskell",
					"go",
					"latex",
					"c",
					"cpp",
					"html",
					"javascript",
					"java",
					"odin",
					"lua",
					"gitcommit",
					"gitignore",
					"ocaml",
					"bash",
					"python",
					"hyprlang",
					"commonlisp",
					"scheme",
					"toml",
					"yaml",
					"norg",
					"markdown",
					"markdown_inline",
				},
				sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
				ignore_install = { "" }, -- List of parsers to ignore installing
				autopairs = {
					enable = true,
				},
				highlight = {
					enable = true, -- false will disable the whole extension
					--disable = { "tex", "latex" },
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true, disable = { "yaml" } },
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
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

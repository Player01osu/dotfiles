local fn = vim.fn
local prog_lang = { "lua", "rust", "c", "cpp", "cs", "js", "json", "html", "sh", "zsh", "bash", "conf", "java" }

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
 ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
-- Install your plugins here
return packer.startup(function(use)
	use 'andweeb/presence.nvim'

	-- Plugin manager --
	use({
		"wbthomason/packer.nvim",
	})
	use({
		"folke/neodev.nvim",
	})

	use "ido-nvim/ido.nvim"

	-- Markdown --
	use({
		"vimwiki/vimwiki",
		branch = "dev", --ft = { "wiki" },
		config = function()
			vim.g["vimwiki_global_ext"] = 0
		end,
	})

	use({
		"folke/neoconf.nvim",
	})

	use({
		"preservim/vim-markdown",
		ft = { "md", "markdown" }, -- Markdown folding and indent
	})

	use({
		"godlygeek/tabular",
	})

	--use({
	--	"ActivityWatch/aw-watcher-vim",
	--	--run = ":AWStart",
	--})

	use({
		"nvim-neorg/neorg",
		--run = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								home = "~/Documents/org",
							},
						},
					},
					["core.export"] = {},
					["core.keybinds"] = {
						config = {
							hook = function(keybinds)
								keybinds.map_event_to_mode("norg", {
									n = {
										{ "<Tab>",   "core.integrations.treesitter.next.link" },
										{ "<S-Tab>", "core.integrations.treesitter.previous.link" },
									},
								}, {
									silent = true,
									noremap = true,
								})
								-- Unmaps any Neorg key from the `norg` mode
								--keybinds.remap(
								--	"norg",
								--	"n",
								--	"<CR>",
								--	'<cmd>lua require("user.files.neorg_ft").normal_create_link()<cr>'
								--)
							end,
						},
					},
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	--use({
	--	"lervag/vimtex",
	--	ft = { "tex", "latex" },
	--})

	-- Formatter --
	--use({
	--	"sbdchd/neoformat",
	--})

	-- Lualine --
	use({
		"nvim-lualine/lualine.nvim",
	})

	-- Colorscheme --
	--use '~/.config/nvim/lua/user/bbb'

	--use({
	--	"catppuccin/nvim",
	--	as = "catppuccin",
	--	config = function()
	--		vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
	--		local colors = require("catppuccin.palettes").get_palette()
	--		colors.none = "NONE"
	--		require("catppuccin").setup({
	--			custom_highlights = {
	--				Comment = { fg = colors.overlay1 },
	--				--LineNr = { fg = colors.overlay1 },
	--				--CursorLine = { bg = colors.none },
	--				--CursorLineNr = { fg = colors.lavender },
	--				DiagnosticVirtualTextError = { bg = colors.none },
	--				DiagnosticVirtualTextWarn = { bg = colors.none },
	--				DiagnosticVirtualTextInfo = { bg = colors.none },
	--				DiagnosticVirtualTextHint = { bg = colors.none },
	--			},
	--		})
	--		--vim.api.nvim_command("colorscheme catppuccin")
	--	end,
	--})

	--use({
	--	"sainnhe/edge",
	--})

	--use({
	--	'ramojus/mellifluous.nvim',
	--	requires = { 'rktjmp/lush.nvim' },
	--	config = function()
	--		require 'mellifluous'.setup({
	--			neutral = true, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
	--			bg_contrast = 'hard', -- options: 'soft', 'medium', 'hard'
	--			dim_inactive = false,
	--			color_set = 'mellifluous',
	--			styles = {
	--				comments = 'NONE',
	--				conditionals = 'NONE',
	--				folds = 'NONE',
	--				loops = 'NONE',
	--				functions = 'NONE',
	--				keywords = 'NONE',
	--				strings = 'NONE',
	--				variables = 'NONE',
	--				numbers = 'NONE',
	--				booleans = 'NONE',
	--				properties = 'NONE',
	--				types = 'NONE',
	--				operators = 'NONE',
	--			},
	--			transparent_background = {
	--				enabled = true,
	--				floating_windows = true,
	--				telescope = true,
	--				file_tree = true,
	--				cursor_line = false,
	--				status_line = false,
	--			},
	--			plugins = {
	--				cmp = true,
	--				gitsigns = false,
	--				indent_blankline = true,
	--				nvim_tree = {
	--					enabled = false,
	--					show_root = false,
	--				},
	--				telescope = {
	--					enabled = true,
	--					nvchad_like = true,
	--				},
	--				startify = false,
	--			},
	--		}) -- optional, see configuration section.
	--		--vim.cmd('colorscheme mellifluous')
	--	end,
	--})

	use({ "rktjmp/lush.nvim", requires = { "rktjmp/shipwright.nvim" } })


	-- Indent Blankline --
	use({
		"lukas-reineke/indent-blankline.nvim",
		ft = prog_lang,
	})

	-- LSP --
	use({
		"neovim/nvim-lspconfig", -- enable LSP
	})

	use({
		"williamboman/mason.nvim",
	})

	use({
		"williamboman/mason-lspconfig.nvim",
	})

	use({
		"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	})

	-- Completion plugins --
	use({
		"hrsh7th/nvim-cmp", -- The completion plugin
	})

	use({
		"hrsh7th/cmp-buffer", -- buffer completions
	})

	use({
		"hrsh7th/cmp-path", -- path completions
	})

	use({
		"hrsh7th/cmp-cmdline", -- cmdline completions
	})

	use({
		"saadparwaiz1/cmp_luasnip", -- snippet completions
	})

	use({
		"hrsh7th/cmp-nvim-lsp",
	})

	use({
		"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	})

	use({
		"simrat39/rust-tools.nvim",
	})

	-- Snippets --
	use({
		"L3MON4D3/LuaSnip", --snippet engine
	})
	use({
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	})

	-- Telescope --
	use({
		"nvim-telescope/telescope.nvim",
	})

	use({
		"nvim-lua/popup.nvim",
	})

	use({
		"nvim-lua/plenary.nvim",
	})

	-- Git --
	use({
		"tpope/vim-fugitive",
	})

	use({
		"kyazdani42/nvim-web-devicons",
	})

	-- Treesitter --
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false
		},
	})

	use({
		"stevearc/oil.nvim",
		config = function ()
			require("oil").setup({
				default_file_explorer = false,
			})
		end
	})

	use({
		"nvim-treesitter/playground",
	})

	use({
		"lewis6991/impatient.nvim",
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

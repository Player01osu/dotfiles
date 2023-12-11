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
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		"vimwiki/vimwiki",
		branch = "dev", --ft = { "wiki" },
		config = function()
			vim.g["vimwiki_global_ext"] = 0
		end,
	},
	{
		ft = {'haskell', 'c', 'cpp', 'lua', 'rust', 'python', 'python2', 'nim', 'asm', 'make', 'java', 'javascript', 'kotlin', 'ocaml', 'typescript', 'go', 'elixir', 'elm', 'forth', 'html', 'json', 'toml', 'lisp', 'nix', 'netrw', 'php', 'r', 'scala', 'sql', 'swift', 'tex', 'zig'},
		'andweeb/presence.nvim',
	},
	{
		"preservim/vim-markdown",
		ft = { "md", "markdown" }, -- Markdown folding and indent
	},
	{
		"godlygeek/tabular",
		cmd = "Tabularize",
	},
	{
		"nvim-neorg/neorg",
		--run = ":Neorg sync-parsers", -- This is the important bit!
		ft = { "norg" }, -- Markdown folding and indent
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
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
	},
	--{
	--	"nvim-lualine/lualine.nvim",
	--	enabled = false,
	--},
	-- LSP --
	{
		"neovim/nvim-lspconfig", -- enable LSP
	},

	{
		"williamboman/mason.nvim",
	},

	{
		"williamboman/mason-lspconfig.nvim",
	},

	{
		"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	},

	-- Completion plugins --
	{
		"hrsh7th/nvim-cmp", -- The completion plugin
	},

	{
		"hrsh7th/cmp-buffer", -- buffer completions
	},

	{
		"hrsh7th/cmp-path", -- path completions
	},

	{
		"hrsh7th/cmp-cmdline", -- cmdline completions
	},

	{
		"saadparwaiz1/cmp_luasnip", -- snippet completions
	},

	{
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	},

	{
		"simrat39/rust-tools.nvim",
		ft = {"rust"}
	},

	-- Snippets --
	{
		"L3MON4D3/LuaSnip", --snippet engine
	},
	{
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	},

	-- Telescope --
	{
		"nvim-telescope/telescope.nvim",
	},

	{
		"nvim-lua/popup.nvim",
	},

	{
		"nvim-lua/plenary.nvim",
	},

	-- Git --
	{
		"tpope/vim-fugitive",
	},

	{
		"kyazdani42/nvim-web-devicons",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		--highlight = {
		--	enable = true,
		--	additional_vim_regex_highlighting = false
		--},
	},
	{
		"stevearc/oil.nvim",
		config = function ()
			require("oil").setup({
				default_file_explorer = true,
				cleanup_delay_ms = 1000,
				columns = {
					"permissions",
					"size",
					"mtime",
					"icon",
				},
				view_options = {
					-- Show files and directories that start with "."
					show_hidden = true,
					is_always_hidden = function(name, _)
						return name == ".." or name == "."
					end,
				},
				keymaps = {
					["gX"] = "actions.open_cmdline",
				},
			})
		end
	},
	{ "rktjmp/lush.nvim",
		cmd = "Shipwrite",
		requires = { "rktjmp/shipwright.nvim" } },
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
	},
})

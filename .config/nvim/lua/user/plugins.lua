local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
 ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}
-- Install your plugins here
return packer.startup(function(use)

	-- Plugin manager --
	use {
		"wbthomason/packer.nvim"
	}

	-- Markdown --
	use {
		'vimwiki/vimwiki', branch = "dev", --ft = { "wiki" },
		config = function()
			vim.g["vimwiki_global_ext"] = 0
		end
	}

	use {
		'preservim/vim-markdown',
		ft = { "md", "markdown" } -- Markdown folding and indent
	}

	use {
		"godlygeek/tabular"
	}

	use {
		'lervag/vimtex',
		ft = { "tex", "latex" }
	}

	-- Formatter --
	use {
		"sbdchd/neoformat"
	}

	-- Lualine --
	use {
		"nvim-lualine/lualine.nvim"
	}

	-- Colorscheme --
	use {
		"sainnhe/edge"
	}
	use {
		"xiyaowong/nvim-transparent"
	}
	--use "bluz71/vim-moonfly-colors"
	--use "lukas-reineke/onedark.nvim"
	--use "marko-cerovac/material.nvim"
	--use "yonlu/omni.vim"

	-- Tabline --
	--use {
	--	'akinsho/bufferline.nvim',
	--	requires = 'kyazdani42/nvim-web-devicons'
	--}

	-- Indent Blankline --
	use {
		"lukas-reineke/indent-blankline.nvim",
		ft = { "lua", "rust", "c", "cpp", "cs", "js", "json", "html", "sh", "zsh", "bash", "conf", "java" }
	}

	-- LSP --
	use {
		'neovim/nvim-lspconfig' -- enable LSP
	}

	use {
		"williamboman/mason.nvim"
	}

	use {
		"williamboman/mason-lspconfig.nvim"
	}

	use {
		'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
	}

	-- Completion plugins --
	use {
		'hrsh7th/nvim-cmp', -- The completion plugin
	}

	use {
		'hrsh7th/cmp-buffer', -- buffer completions
	}

	use {
		'hrsh7th/cmp-path', -- path completions
	}

	use {
		'hrsh7th/cmp-cmdline', -- cmdline completions
	}

	use {
		'saadparwaiz1/cmp_luasnip', -- snippet completions
	}

	use {
		'hrsh7th/cmp-nvim-lsp',
	}

	use {
		"windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	}

	use {
		'simrat39/rust-tools.nvim',
	}

	--ft = { "rust", "rs" }
	use {
		'mfussenegger/nvim-dap'
	}

	-- Snippets --
	use {
		"L3MON4D3/LuaSnip" --snippet engine
	}
	use {
		"rafamadriz/friendly-snippets" -- a bunch of snippets to use
	}

	-- Telescope --
	use {
		'nvim-telescope/telescope.nvim'
	}

	use {
		"nvim-lua/popup.nvim"
	}

	use {
		"nvim-lua/plenary.nvim"
	}

	-- Git --
	use {
		"kdheepak/lazygit.nvim"
	}

	use {
		"tpope/vim-fugitive"
	}

	use {
		"kyazdani42/nvim-web-devicons"
	}

	-- Treesitter --
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	use {
		"nvim-treesitter/playground"
	}

	use {
		'lewis6991/impatient.nvim'
	}

	-- Goyo --
	--use{
	--'junegunn/goyo.vim',
	--  ft = { "vimwiki", "wiki", "md", "markdown" },
	--  cmd = 'Goyo'
	--}

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

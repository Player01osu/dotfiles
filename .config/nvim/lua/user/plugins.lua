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

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- markdown/vimwiki
  use {
    "vimwiki/vimwiki", branch = "dev",
    -- keys = { "<leader>x" },
    config = function()
--      vim.g["vimwiki_list"] = {
--        {
--          template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
--          syntax = "vimwiki", ext = ".wiki"
--        }
--      }
      vim.g["vimwiki_global_ext"] = 0
    end
  }
  use "preservim/vim-markdown" -- Markdown folding and indent
  use "godlygeek/tabular"

  -- cmp plugins
--  use "hrsh7th/nvim-cmp" -- The completion plugin
--  use "hrsh7th/cmp-buffer" -- buffer completions
--  use "hrsh7th/cmp-path" -- path completions
--  use "hrsh7th/cmp-cmdline" -- cmdline completions
--  use "saadparwaiz1/cmp_luasnip" -- snippet completions
--  use "hrsh7th/cmp-nvim-lsp"
  use "simrat39/rust-tools.nvim"

  -- lua line
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"

  -- Colorschemes
  use "marko-cerovac/material.nvim"

  -- Goyo
  use "junegunn/goyo.vim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Coc
  use {
    "neoclide/coc.nvim", branch = "release",
  }

  -- LSP
--  use "neovim/nvim-lspconfig" -- enable LSP
--  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
--  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
--  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
--  use "dense-analysis/ale"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

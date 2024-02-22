-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope, a highly extendable fuzzy finder over lists
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Rose Pine, a Neovim theme with a soothing pastel color palette
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  -- Trouble.nvim, a pretty list to help you solve diagnostics, references, and more
  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  -- nvim-treesitter, Neovim treesitter configurations for better syntax highlighting
  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")  -- Tree-sitter playground for live and interactive syntax tree
  use("theprimeagen/harpoon")  -- Harpoon, a utility to navigate and organize your workspace
  use("theprimeagen/refactoring.nvim")  -- Refactoring tools for Neovim, powered by Treesitter
  use("mbbill/undotree")  -- Undotree, a visual undo history tool
  use("tpope/vim-fugitive")  -- Vim-fugitive, a Git wrapper for Vim
  use("nvim-treesitter/nvim-treesitter-context");  -- nvim-treesitter-context, shows the context of the current function/class you're in

  -- lsp-zero.nvim, an opinionated configuration for Neovim LSP, autocompletion, and snippets
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")  -- Zen Mode, distraction-free coding for Neovim
  use("github/copilot.vim")  -- GitHub Copilot, AI pair programmer plugin
  use("eandrju/cellular-automaton.nvim")  -- Cellular Automaton, a generative art plugin
  use("laytan/cloak.nvim")  -- Cloak, a plugin for sensitive data hiding in Neovim

  -- Sync packer if it's the first run
  if packer_bootstrap then
    require('packer').sync()
  end
end)


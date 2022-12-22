-- Automatically install packer if it isn't installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autoupdate pacakges when package file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
	-- Plugin manager
	use 'wbthomason/packer.nvim'

	-- Optimizer
	use 'lewis6991/impatient.nvim'

	-- Color theme
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Lsp
	use "neovim/nvim-lspconfig"

    -- Rust lsp
    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'
    use 'simrat39/rust-tools.nvim'

	-- cmp
	use 'hrsh7th/cmp-nvim-lsp'
  	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
  	use 'hrsh7th/nvim-cmp'
  	use 'hrsh7th/vim-vsnip'

    -- Autoformatter
    use 'jose-elias-alvarez/null-ls.nvim'
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
	
	-- Easymotion
	use {
	  'phaazon/hop.nvim',
	  branch = 'v1', -- optional but strongly recommended
	  config = function()
	    -- you can configure Hop the way you like here; see :h hop-config
	    require'hop'.setup()
	  end
	}

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Tree-sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Git signs
	use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use "rebelot/heirline.nvim"

	-- Toggle term
	use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
		require 'toggleterm-config'
	end}

    -- Code diagnostics window
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- File explorer
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        }
      }

    -- Fugitive 
    use "tpope/vim-fugitive"

    -- Markdown preview
    use 'davidgranstrom/nvim-markdown-preview'

    -- Feline
    use 'feline-nvim/feline.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

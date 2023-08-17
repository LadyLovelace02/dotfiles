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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim' -- lua functions
--  use 'folke/tokyonight.nvim' -- colourscheme
  use 'catppuccin/nvim'
  use 'christoomey/vim-tmux-navigator' -- window navigation
  use 'szw/vim-maximizer' -- window maximizer
  use 'tpope/vim-surround' -- manage surounding brackets
  use 'numToStr/Comment.nvim' -- commenting
  use 'nvim-tree/nvim-tree.lua' -- file explorer
  use 'kyazdani42/nvim-web-devicons' -- add file icons to file explorer
  use 'nvim-lualine/lualine.nvim' -- beautify the bottom bar
  use {'nvim-telescope/telescope-fzf-native.nvim', run = "make"}
  use {'nvim-telescope/telescope.nvim', branch = "0.1.x"}
  --auto complete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- manage and install lsp servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- configuring the lsp servers
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })
  -- use {'glepnir/lspaga.nvim', branch = "main"} -- not working
  use 'onsails/lspkind.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

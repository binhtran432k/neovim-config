-- Automatically install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
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
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

local use = packer.use

packer.startup {function()
  -- (( Packer Manager ))
  use 'wbthomason/packer.nvim'

  -- (( Startup Screen ))
  use {
    'goolord/alpha-nvim',
    require = { 'kyazdani42/nvim-web-devicons' }
  }

  -- (( Git ))
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'f-person/git-blame.nvim'

  -- (( UI to select things (files, grep results, open buffers...) ))
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- (( File explorer ))
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }

  -- (( Terminal ))
  use 'akinsho/toggleterm.nvim'

  -- (( Color scheme ))
  use { 'dracula/vim', as = 'dracula' } -- Theme inspired by Atom

  -- (( Status line ))
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- (( Indentation ))
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  use 'Darazaki/indent-o-matic' -- For fast auto detect indent

  -- (( Treesitter ))
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'romgrk/nvim-treesitter-context'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'p00f/nvim-ts-rainbow' -- for rainbow parenthesis
  use 'windwp/nvim-ts-autotag' -- autotag with treesitter
  use 'mizlan/iswap.nvim'
  use 'nvim-treesitter/playground'

  -- (( LSP ))
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'ray-x/lsp_signature.nvim'
  use 'folke/trouble.nvim'

  -- (( Auto completion ))
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'f3fora/cmp-spell'
  use 'onsails/lspkind-nvim'
  use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter

  -- (( Snippets ))
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- (( Debugging ))
  use 'mfussenegger/nvim-dap' -- Debug Adapter Protocol
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'Pocco81/DAPInstall.nvim'

  -- (( Utils ))
  use 'numToStr/Comment.nvim' -- 'gc' to comment visual regions/lines
  use 'blackCauldron7/surround.nvim'
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }
  use 'wellle/targets.vim'
  use 'bkad/CamelCaseMotion'
  use 'karb94/neoscroll.nvim'
  use 'andymass/vim-matchup'
  use 'norcalli/nvim-colorizer.lua'
  use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'folke/which-key.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'antoinemadec/FixCursorHold.nvim'
  -- Is using a standard Neovim install, i.e. built from source or using a
  -- provided appimage.
  use 'lewis6991/impatient.nvim'
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  -- (( Custom Highlight Syntax ))
  use { 'sheerun/vim-polyglot' }

  -- (( Extensions ))
  use { 'lervag/vimtex', ft = { 'latex', 'tex', 'bib' } }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end, config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
}

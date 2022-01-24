local Plug = vim.fn['plug#']
local nvim_config_dir = '~/.config/nvim/'

vim.call('plug#begin', nvim_config_dir .. 'plugged')

-- (( Theme ))
Plug('dracula/vim', { ['as'] = 'dracula' }) -- Dracula theme

-- (( File browser ))
Plug('preservim/nerdtree') -- NERDTree File browser
Plug('PhilRunninger/nerdtree-visual-selection') -- NERDTree multiple file edit
Plug('Xuyuanp/nerdtree-git-plugin') -- NERDTree Git status
Plug('tiagofumo/vim-nerdtree-syntax-highlight') -- NERDTree syntax highlight
Plug('ryanoasis/vim-devicons') -- Vim-devicons Icon
Plug('Lokaltog/neoranger') -- Ranger for neovim

-- (( File search ))
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install()'] }) -- Fuzzy finder
Plug('junegunn/fzf.vim') -- Fuzzy wrapper for vim

-- (( Status bar ))
Plug('vim-airline/vim-airline') -- Vim airline

-- (( Terminal ))
Plug('voldikss/vim-floaterm') -- Float terminal

-- (( Code intellisense ))
Plug('neoclide/coc.nvim', { ['branch'] = 'release' }) -- Language server
Plug('jiangmiao/auto-pairs') -- Auto pairs
Plug('alvan/vim-closetag') -- Vim Closetag
Plug('tpope/vim-surround') -- For easy to change surround
Plug('bkad/CamelCaseMotion') -- For camel motion in vim
Plug('kana/vim-textobj-user') -- For custom select object
Plug('kana/vim-textobj-entire') -- For selecting all file
Plug('wellle/targets.vim') -- For advance select object
Plug('tpope/vim-commentary') -- For easy comment
Plug('honza/vim-snippets') -- Snippets for vim
Plug('captbaritone/better-indent-support-for-php-with-html')
Plug('easymotion/vim-easymotion') -- Easy motion
Plug('terryma/vim-expand-region') -- Expand selection
Plug('triglav/vim-visual-increment')
-- Plug('prettier/vim-prettier')

-- (( Special extension ))
Plug('lervag/vimtex') -- For latex
Plug('tyru/open-browser.vim') -- hooks for opening browser
Plug('weirongxu/plantuml-previewer.vim') -- Plantuml previewer

-- (( Code syntax highlight ))
Plug('lukas-reineke/indent-blankline.nvim') -- Indent rainbow
Plug('sheerun/vim-polyglot') -- For almost language syntax support
Plug('Darazaki/indent-o-matic') -- For fast auto detect indent
Plug('binhtran432k/vim-restclient-syntax') -- For http syntax support

-- (( Debugging ))
Plug('puremourning/vimspector') -- Vimspector

-- (( Source code version control ))
Plug('tpope/vim-fugitive') -- Git

vim.call('plug#end')

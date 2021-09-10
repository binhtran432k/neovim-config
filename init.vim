"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimPlug for managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let config_folder = '~/.config/nvim'                    " Set config folder

call plug#begin(config_folder.'/plugged')

    "(( Theme ))
    Plug 'Mofiqul/dracula.nvim'                         " Dracula theme

    "(( File browser ))
    Plug 'preservim/nerdtree'                           " NERDTree File browser
    Plug 'Xuyuanp/nerdtree-git-plugin'                  " NERDTree Git status
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " NERDTree syntax highlight
    Plug 'ryanoasis/vim-devicons'                       " Vim-devicons Icon

    "(( File search ))
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
    Plug 'junegunn/fzf.vim'

    "(( Status bar ))
    Plug 'vim-airline/vim-airline'                      " Vim airline
    Plug 'vim-airline/vim-airline-themes'

    "(( Terminal ))
    Plug 'voldikss/vim-floaterm'                        " Float terminal

    "(( Code intellisense ))
    Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Language server
    Plug 'jiangmiao/auto-pairs'                         " Auto pairs
    Plug 'alvan/vim-closetag'                           " Vim Closetag
    Plug 'mattn/emmet-vim'                              " Emmet for neovim

    "(( Code syntax highlight ))
    Plug 'luochen1990/rainbow'                          " Bracket rainbow
    Plug 'lukas-reineke/indent-blankline.nvim'          " Indent rainbow

    "(( Debugging ))
    Plug 'puremourning/vimspector'                      " Vimspector

    "(( Source code version control ))
    Plug 'tpope/vim-fugitive'                           " Git

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn
set mouse=a " Make text can select by mouse

" Make tabstop to 4 space
set tabstop=4
set shiftwidth=4
set expandtab

" Make fold by indent
set foldmethod=indent
set foldlevelstart=99

set number " Show line number
set list listchars=eol:↴,space:.,tab:\>\ 
set termguicolors

let mapleader = ',' " Change leader key
inoremap <S-Tab> <C-V><Tab>

" Make neovim save last cursor position
" autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
set viewoptions-=options
augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
    autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula " Using dracula:
"set list listchars=space:.,tab:\>\ 
highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine
highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine
highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine
highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine
highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine
highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine

let g:indent_blankline_space_char_blankline = ' '
let g:indent_blankline_char_highlight_list = ['IndentBlanklineIndent1', 'IndentBlanklineIndent2', 'IndentBlanklineIndent3', 'IndentBlanklineIndent4', 'IndentBlanklineIndent5', 'IndentBlanklineIndent6']

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

""""""""""""""""""""""""""""""""""""""""""""""
" => Other settings
""""""""""""""""""""""""""""""""""""""""""""""
execute 'source '.config_folder.'/settings/nerdtree.vim'
execute 'source '.config_folder.'/settings/im.vim'
execute 'source '.config_folder.'/settings/vimspector.vim'

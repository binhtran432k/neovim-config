"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimPlug for managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

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

    "(( Debugging ))
    Plug 'puremourning/vimspector'                      " Vimspector

    "(( Source code version control ))
    Plug 'tpope/vim-fugitive'                           " Git

    "((  ))
    Plug 'neovim/nvim-lspconfig'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=indent
set number
set foldlevelstart=99
syntax on
set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula " Using dracula:

""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""
" Map key for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


if exists('g:vscode')
    " Make fold in vscode
    " Support k/j with fold
    nnoremap k :<C-u>call VSCodeCall('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
    nnoremap j :<C-u>call VSCodeCall('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
    " Support for fold
    nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
    nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
    nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
    nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
    nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
    nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
    nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>

    nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
    nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
    nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
    nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
    nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
    nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
    nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>

    xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>
    " Support comment
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
endif

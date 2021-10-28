"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimPlug for managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Global path setting
if has('win32')
  let nvim_config_dir = '~/AppData/Local/nvim/'
else
  let nvim_config_dir = '~/.config/nvim/'
endif

set nocompatible

call plug#begin(nvim_config_dir.'/plugged')

"(( Theme ))
Plug 'dracula/vim', { 'as': 'dracula' } " Dracula theme

"(( File browser ))
Plug 'preservim/nerdtree'                      " NERDTree File browser
Plug 'PhilRunninger/nerdtree-visual-selection' " NERDTree multiple file edit
Plug 'Xuyuanp/nerdtree-git-plugin'             " NERDTree Git status
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NERDTree syntax highlight
Plug 'ryanoasis/vim-devicons'                  " Vim-devicons Icon

"(( File search ))
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'                             " Fuzzy wrapper for vim

"(( Status bar ))
Plug 'vim-airline/vim-airline' " Vim airline

"(( Terminal ))
Plug 'voldikss/vim-floaterm' " Float terminal

"(( Code intellisense ))
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server
Plug 'jiangmiao/auto-pairs'                     " Auto pairs
Plug 'alvan/vim-closetag'                       " Vim Closetag
Plug 'tpope/vim-surround'                       " For easy to change surround
Plug 'junegunn/vim-easy-align'                  " For easy to change align
Plug 'kana/vim-textobj-user'                    " For custom select object
Plug 'kana/vim-textobj-entire'                  " For selecting all file
Plug 'wellle/targets.vim'                       " For advance select object
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'                       " Snippets for vim
Plug 'captbaritone/better-indent-support-for-php-with-html'
" Plug 'prettier/vim-prettier'

"(( Special extension ))
Plug 'lervag/vimtex'                    " For latex
Plug 'tyru/open-browser.vim'            " hooks for opening browser
Plug 'weirongxu/plantuml-previewer.vim' " Plantuml previewer

"(( Code syntax highlight ))
Plug 'lukas-reineke/indent-blankline.nvim' " Indent rainbow
Plug 'sheerun/vim-polyglot'                " For almost language syntax support

"(( Debugging ))
Plug 'puremourning/vimspector' " Vimspector

"(( Source code version control ))
Plug 'tpope/vim-fugitive'                           " Git

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" => Coc Extension List
""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-htmlhint',
  \ 'coc-html-css-support',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-phpls',
  \ 'coc-php-cs-fixer',
  \ 'coc-snippets',
  \ 'coc-stylelintplus',
  \ 'coc-tsserver',
  \ 'coc-vimtex'
\]


""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""
" search ignore sensitive
set ignorecase
" set cursorcolumn
set cursorline
set guicursor=n-c:block,i-ci-ve:ver40,r-cr-v:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
set mouse=a " Make text can select by mouse

" Make tabstop to 4 space
" set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" Make fold by indent
set foldmethod=indent
set foldlevelstart=99

set number " Show line number
" Highlight problematic whitespace
set list listchars=tab:›\ ,trail:•,extends:#,nbsp:.,space:⋅,eol:↴
"set list listchars=space:.,tab:\>\ 

" Make neovim save last cursor position
" autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
set viewoptions-=options
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
  autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
augroup END

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Disable automatic comment in newline
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors                                                   " Make terminal use colorscheme
set background=dark
syntax on
colorscheme dracula                                                 " Using dracula:

set colorcolumn=80,100,120

" Font 
let g:airline_powerline_fonts = 1
if has('win32')
  set guifont=Delugia:h12 " Powerline font
endif

" Tabbar
let g:airline#extensions#tabline#enabled = 1                        " Enable Tab bar
" let g:airline_left_sep = '▓▒░'
" let g:airline_right_sep = '░▒▓'
let g:airline_left_sep = '▒'
let g:airline_left_alt_sep = '│'
let g:airline_right_sep = '▒'
let g:airline_right_alt_sep = '│'
" let g:airline#extensions#tabline#left_sep = ''                      " Enable Tab seperator 
" let g:airline#extensions#tabline#left_alt_sep = '|'                 " Enable Tab seperator
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline#extensions#tabline#fnamemod = ':t'                    " Set Tab name as file name

let g:airline#extensions#whitespace#enabled = 0                     " Remove warning whitespace

" Rainbow Indent
highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine
highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine
highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine
highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine
highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine
highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine

let g:indent_blankline_space_char_blankline = ' '
let g:indent_blankline_char_highlight_list = ['IndentBlanklineIndent1', 'IndentBlanklineIndent2', 'IndentBlanklineIndent3', 'IndentBlanklineIndent4', 'IndentBlanklineIndent5', 'IndentBlanklineIndent6']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let mapleader = ',' " Change leader key
tnoremap <leader>, ,
inoremap <S-Tab> <C-V><Tab>

" Window moving
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Resize pane
nnoremap <M-Right> :<C-u>vertical resize +1<CR>
nnoremap <M-Left> :<C-u>vertical resize -1<CR>
nnoremap <M-Down> :<C-u>resize +1<CR>
nnoremap <M-Up> :<C-u>resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Dehightlight text after press <cr>
" nnoremap <CR> :<C-u>nohl<CR><CR>
nnoremap <silent><expr> <CR>
  \ (&hlsearch && v:hlsearch) ? ":\<C-u>nohl\<CR>" :
  \ "\<CR>"

" Indent Converter Command
func! s:indent_converter(action, ...)
  if (a:0 == 2 || a:0 == 1 || a:0 == 0)
    let l:toNum = a:0 > 0? a:1 : 4
    let l:fromNum = a:0 == 2? a:2 : &shiftwidth
    let l:savedView = winsaveview()
    if (a:action == 'space')
      if (&expandtab)
        execute '%s@^\( \{'.l:fromNum.'}\)\+@\=repeat(" ", len(submatch(0))*'.l:toNum.'/'.l:fromNum.')@'
      else
        execute '%s@^\t\+@\=repeat(" ", len(submatch(0))*'.l:toNum.')@'
      endif
      execute 'set ts='.l:toNum.' sts='.l:toNum.' sw='.l:toNum.' et'
    elseif (a:action == 'tab')
      if (&expandtab)
        execute '%s@^\( \{'.l:fromNum.'}\)\+@\=repeat("\t", len(submatch(0))/'.l:fromNum.')@'
      endif
      execute 'set ts='.l:toNum.' sts='.l:toNum.' sw='.l:toNum.' noet'
    endif
    call winrestview(l:savedView)
  endif
endfunction

command! -nargs=* IndentToSpace :call s:indent_converter('space', <f-args>)
command! -nargs=* IndentToTab :call s:indent_converter('tab', <f-args>)


""""""""""""""""""""""""""""""""""""""""""""""
" => Other settings
""""""""""""""""""""""""""""""""""""""""""""""
let nvim_settings_dir = nvim_config_dir.'settings/'

execute 'source '.nvim_settings_dir.'coc.vim'
execute 'source '.nvim_settings_dir.'easy-align.vim'
execute 'source '.nvim_settings_dir.'floaterm.vim'
execute 'source '.nvim_settings_dir.'fzf.vim'
execute 'source '.nvim_settings_dir.'ibus.vim'
execute 'source '.nvim_settings_dir.'keymap.vim'
execute 'source '.nvim_settings_dir.'nerdtree.vim'
execute 'source '.nvim_settings_dir.'vimspector.vim'
execute 'source '.nvim_settings_dir.'vimtex.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other scripts 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" let nvim_scripts_dir = nvim_config_dir.'scripts/'

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

" (( Disable polyglot autoindent ))
let g:polyglot_disabled = ['autoindent']

call plug#begin(nvim_config_dir.'/plugged')

"(( Theme ))
Plug 'dracula/vim', { 'as': 'dracula' } " Dracula theme

"(( File browser ))
Plug 'preservim/nerdtree'                      " NERDTree File browser
Plug 'PhilRunninger/nerdtree-visual-selection' " NERDTree multiple file edit
Plug 'Xuyuanp/nerdtree-git-plugin'             " NERDTree Git status
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NERDTree syntax highlight
Plug 'ryanoasis/vim-devicons'                  " Vim-devicons Icon
Plug 'Lokaltog/neoranger'

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
Plug 'bkad/CamelCaseMotion'                     " For camel motion in vim
Plug 'kana/vim-textobj-user'                    " For custom select object
Plug 'kana/vim-textobj-entire'                  " For selecting all file
Plug 'wellle/targets.vim'                       " For advance select object
Plug 'tpope/vim-commentary'                     " For easy comment
Plug 'honza/vim-snippets'                       " Snippets for vim
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'easymotion/vim-easymotion'                " Easy motion
Plug 'terryma/vim-expand-region'                " Expand selection
Plug 'triglav/vim-visual-increment'
" Plug 'prettier/vim-prettier'

"(( Special extension ))
Plug 'lervag/vimtex'                    " For latex
Plug 'tyru/open-browser.vim'            " hooks for opening browser
Plug 'weirongxu/plantuml-previewer.vim' " Plantuml previewer

"(( Code syntax highlight ))
Plug 'lukas-reineke/indent-blankline.nvim' " Indent rainbow
Plug 'sheerun/vim-polyglot'                " For almost language syntax support
Plug 'Darazaki/indent-o-matic'             " For fast auto detect indent
Plug 'binhtran432k/vim-restclient-syntax'  " For http syntax support

"(( Debugging ))
Plug 'puremourning/vimspector' " Vimspector

"(( Source code version control ))
Plug 'tpope/vim-fugitive'                           " Git

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""
" => Coc Extension List
""""""""""""""""""""""""""""""""""""""""""""""
"(( For all ))
let g:coc_global_extensions = [
  \ 'coc-highlight',
  \ 'coc-snippets',
  \ 'coc-lightbulb',
  \ 'coc-spell-checker',
\ ]

"(( For c/c++ ))
let g:coc_global_extensions += [
  \ 'coc-clangd',
\ ]

"(( For css ))
let g:coc_global_extensions += [
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-stylelintplus',
\ ]

"(( For html ))
let g:coc_global_extensions += [
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-htmlhint',
  \ 'coc-html-css-support',
\ ]

"(( For http ))
let g:coc_global_extensions += [
  \ 'coc-restclient',
\ ]

"(( For javascript/typescript ))
let g:coc_global_extensions += [
  \ 'coc-eslint',
  \ 'coc-tsserver',
\ ]

"(( For json ))
let g:coc_global_extensions += [
  \ 'coc-json',
\ ]

"(( For latex ))
let g:coc_global_extensions += [
  \ 'coc-vimtex',
\ ]

"(( For php ))
let g:coc_global_extensions += [
  \ 'coc-phpls',
\ ]


""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""
" search ignore sensitive
set ignorecase
set smartcase
" set cursorcolumn
set cursorline
set guicursor=n-c:block,i-ci-ve:ver40,r-cr-v:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
set mouse=a " Make text can select by mouse

set nrformats=alpha,bin,hex

" Make tabstop to 4 space
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" Make fold by indent
set foldmethod=indent
set foldlevelstart=99

set number " Show line number
set relativenumber
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
" au CursorHold,CursorHoldI * checktime
" au FocusGained,BufEnter * :checktime
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
"   \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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
let g:indent_blankline_space_char_blankline = ' '
let g:indent_blankline_char_highlight_list = ['Error', 'String', 'Function', 'Type', 'Keyword', 'Constant']
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_filetype_exclude = ['help', 'nerdtree']
let g:indent_blankline_buftype_exclude = ['terminal']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let mapleader = ',' " Change leader key
" Map localleader for latex shortkey
let maplocalleader = "\;"
let g:camelcasemotion_key = '<leader>' " For Camel motion
tnoremap <leader>, ,
inoremap <S-Tab> <C-V><Tab>

" Window moving
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

" Resize pane
nnoremap <M-Right> :<C-u>vertical resize +1<CR>
nnoremap <M-Left> :<C-u>vertical resize -1<CR>
nnoremap <M-Down> :<C-u>resize +1<CR>
nnoremap <M-Up> :<C-u>resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" DeHighlight text after press <cr>
" nnoremap <CR> :<C-u>nohl<CR><CR>
nnoremap <silent><expr> <CR>
  \ (&hlsearch && v:hlsearch) ? ":\<C-u>nohl\<CR>" :
  \ "\<CR>"

" Indent Converter Command
func! s:indent_converter(fromIndent, toIndent, ...)
  let l:fromNum = a:1
  let l:toNum = a:2
  let l:savedView = winsaveview()
  if (a:toIndent == 'space')
    if (a:fromIndent == 'space')
      execute '%s@^\( \{'.l:fromNum.'}\)\+@\=repeat(" ", len(submatch(0))*'.l:toNum.'/'.l:fromNum.')@'
    elseif (a:fromIndent == 'tab')
      execute '%s@^\t\+@\=repeat(" ", len(submatch(0))*'.l:toNum.')@'
    endif
    execute 'set ts='.l:toNum.' sts='.l:toNum.' sw='.l:toNum.' et'
  elseif (a:toIndent == 'tab')
    if (a:fromIndent == 'space')
      execute '%s@^\( \{'.l:fromNum.'}\)\+@\=repeat("\t", len(submatch(0))/'.l:fromNum.')@'
    endif
    execute 'set ts='.l:toNum.' sts='.l:toNum.' sw='.l:toNum.' noet'
  endif
  call winrestview(l:savedView)
endfunction

command! -nargs=* SpaceToSpace :call s:indent_converter('space', 'space', <f-args>)
command! -nargs=* SpaceToTab :call s:indent_converter('space', 'tab', <f-args>)
command! -nargs=* TabToSpace :call s:indent_converter('tab', 'space', <f-args>)
command! -nargs=* TabToTab :call s:indent_converter('tab', 'tab', <f-args>)


""""""""""""""""""""""""""""""""""""""""""""""
" => Other settings
""""""""""""""""""""""""""""""""""""""""""""""
let nvim_settings_dir = nvim_config_dir.'settings/'

execute 'source '.nvim_settings_dir.'coc.vim'
execute 'source '.nvim_settings_dir.'easy-align.vim'
execute 'source '.nvim_settings_dir.'easy-motion.vim'
execute 'source '.nvim_settings_dir.'floaterm.vim'
execute 'source '.nvim_settings_dir.'fzf.vim'
execute 'source '.nvim_settings_dir.'ibus.vim'
execute 'source '.nvim_settings_dir.'keymap.vim'
execute 'source '.nvim_settings_dir.'neoranger.vim'
execute 'source '.nvim_settings_dir.'nerdtree.vim'
execute 'source '.nvim_settings_dir.'vimspector.vim'
execute 'source '.nvim_settings_dir.'vimtex.vim'
execute 'source '.nvim_settings_dir.'indent-o-matic.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other scripts 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" let nvim_scripts_dir = nvim_config_dir.'scripts/'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix conflict 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" (( Fix vimtex ))
autocmd FileType tex xmap ae <plug>(vimtex-ae)
autocmd FileType tex xmap ie <plug>(vimtex-ie)
autocmd FileType tex xmap ac <plug>(vimtex-ac)
autocmd FileType tex xmap ic <plug>(vimtex-ic)

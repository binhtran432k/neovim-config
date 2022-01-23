" Make main.tex as default latex project
autocmd FileType tex let b:vimtex_main = 'main.tex'

" Unset callback
"let g:vimtex_compiler_latexmk = { 
"  \  'callback' : 0,
"  \}

" Setup default pdf viewer

"((Zathura))
" let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_method = 'zathura'

"((MuPdf))
" let g:vimtex_view_method = 'mupdf'

"((Okular))
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

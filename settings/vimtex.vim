" Map localleader for latex shortkey
let maplocalleader = "\,"

" Mkke main.tex as default latex project
autocmd FileType tex let b:vimtex_main = 'main.tex'

" Make zathura as default
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:vimtex_view_enabled=1
let g:vimtex_view_automatic=1
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = { 
  \  'callback' : 0,
  \}

" Config vimtex with neovim
let g:vimtex_compiler_progname = 'nvr'

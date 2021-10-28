let g:floaterm_position = 'topright'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']
if has('win32')
  let g:floaterm_shell = 'powershell -nologo'
endif

" Set color
" hi Floaterm guibg=Grey15
" hi FloatermBorder guifg=LightPink guibg=DarkViolet
" hi FloatermNC guibg=darkred


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkey to manage terminals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a new terminal 
let g:floaterm_keymap_new    = '<leader>to'
" nnoremap   <silent>   <leader>to    :FloatermNew<CR>
" tnoremap   <silent>   <leader>to    <C-\><C-n>:FloatermNew<CR>

" Kill current terminal 
let g:floaterm_keymap_kill    = '<leader>tk'
" nnoremap <silent>   <leader>tk      :FloatermKill<CR>:FloatermPrev<CR>
" tnoremap <silent>   <leader>tk      <C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>

" Navigation next and previous terminal 
let g:floaterm_keymap_next   = '<leader>tn'
" nnoremap <silent>   <leader>tn      :FloatermNext<CR>
" tnoremap <silent>   <leader>tn      <C-\><C-n>:FloatermNext<CR>
let g:floaterm_keymap_prev   = '<leader>tp'
" nnoremap <silent>   <leader>tp      :FloatermPrev<CR>
" tnoremap <silent>   <leader>tp      <C-\><C-n>:FloatermPrev<CR>

" Toggle terminal
let g:floaterm_keymap_toggle = '<leader>tt'
" nnoremap <silent>   <leader>tt      :FloatermToggle<CR>
" tnoremap <silent>   <leader>tt      <C-\><C-n>:FloatermToggle<CR>

" Focus terminal 
" nnoremap <silent>   <leader>tf      <C-\><C-n><C-W><Left>
tnoremap <silent>   <leader>tf      <C-\><C-n><C-W><Left>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkey to run other console apps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

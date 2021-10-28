let g:ibus_us_engine = 'BambooUs::Candy'

function! IBusOff()
  " Save current engine
  let g:ibus_prev_engine = system('ibus engine')
  " Change engine to English (US)
  silent! execute '!ibus engine ' . g:ibus_us_engine
endfunction

function! IBusOn()
  " Get current engine
  let l:current_engine = system('ibus engine')
  " Assign previous engine if current engine is not English (US)
  if l:current_engine !~? g:ibus_us_engine
    let g:ibus_prev_engine = l:current_engine
  endif
  " Restore previous engine
  silent! execute '!ibus engine ' . g:ibus_prev_engine
endfunction

augroup IBusHandler
  " Restore engine for search
  autocmd CmdLineEnter [/?] silent call IBusOn()
  autocmd CmdLineLeave [/?] silent call IBusOff()
  autocmd CmdLineEnter \? silent call IBusOn()
  autocmd CmdLineLeave \? silent call IBusOff()
  " Restore engine if enter insert mode
  autocmd InsertEnter * silent call IBusOn()
  " Make engine to English if leave insert mode
  autocmd InsertLeave * silent call IBusOff()
augroup END

" Open with english engine
silent call IBusOff()

-- Indent Converter Command
vim.cmd [[
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
]]

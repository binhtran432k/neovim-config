local map = vim.api.nvim_set_keymap
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Set internal encoding of vim, not needed on neovim, since coc.nvim using some
-- unicode characters in the file autoload/float.vim
vim.opt.encoding = 'utf-8'

-- TextEdit might fail if hidden is not set.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append('c')

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
if vim.fn.has('nvim-0.5.0') == 1 or vim.fn.has('patch-8.1.1564') == 1 then
  -- Recently vim can merge signcolumn and number column into one
  vim.opt.signcolumn = 'number'
else
  vim.opt.signcolumn = 'yes'
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
-- inoremap <silent><expr> <TAB>
--       \ pumvisible() ? "\<C-n>" :
--       \ <SID>check_back_space() ? "\<TAB>" :
--       \ coc#refresh()
-- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

-- Use <c-space> to trigger completion.
if vim.fn.has('nvim') == 1 then
  map('i', '<C-space>', 'coc#refresh()', {
      noremap = true,
      silent = true,
      expr = true,
    })
else
  map('i', '<C-@>', 'coc#refresh()', {
      noremap = true,
      silent = true,
      expr = true,
    })
end

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
-- inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
--                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

-- Make <CR> select if needed
function _G.smartSelectSuggestionWithCR()
  if vim.fn.complete_info({'selected'})['selected'] ~= -1 then
    return t'<C-y>'
  else
    return t'<C-g>u<CR>'
  end
end
if vim.fn.exists('*complete_info') == 1 then
  map('i', '<CR>', 'v:lua.smartSelectSuggestionWithCR()', {
      noremap = true,
      silent = true,
      expr = true,
    })
end

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
map('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

-- GoTo code navigation.
map('n', 'gd', '<Plug>(coc-definition)', { silent = true })
map('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
map('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
map('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Use K to show documentation in preview window.
function _G.showDocumentation()
  if vim.fn.index({'vim','help'}, vim.opt.filetype['_value']) >= 0 then
    vim.cmd([[execute 'h '.expand('<cword>')]])
  elseif vim.fn['coc#rpc#ready']() == 1 then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd([[execute '!' . &keywordprg . " " . expand('<cword>')]])
  end
end
map('n', 'K', '<cmd>lua showDocumentation()<CR>', { noremap = true, silent = true })

-- Highlight the symbol and its references when holding the cursor.
vim.cmd [[
  autocmd CursorHold * silent call CocActionAsync('highlight')
]]

-- Symbol renaming.
map('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- Formatting selected code.
map('x', '<leader>p', '<Plug>(coc-rename)', {})
map('n', '<leader>p', '<Plug>(coc-rename)', {})

vim.cmd [[
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]]

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
map('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
map('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {})

-- Remap keys for applying codeAction to the current buffer.
map('n', '<leader>ac', '<Plug>(coc-codeaction)', {})
-- Apply AutoFix to problem on the current line.
map('n', '<leader>qf', '<Plug>(coc-fix-current)', {})

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map('x', 'if', '<Plug>(coc-funcobj-i)', {})
map('o', 'if', '<Plug>(coc-funcobj-i)', {})
map('x', 'af', '<Plug>(coc-funcobj-a)', {})
map('o', 'af', '<Plug>(coc-funcobj-a)', {})
map('x', 'ic', '<Plug>(coc-classobj-i)', {})
map('o', 'ic', '<Plug>(coc-classobj-i)', {})
map('x', 'ac', '<Plug>(coc-classobj-a)', {})
map('o', 'ac', '<Plug>(coc-classobj-a)', {})

-- Remap <C-f> and <C-b> for scroll float windows/popups.
if vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1 then
  map(
    'n', '<C-f>', [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
    { noremap = true, silent = true, nowait = true, expr = true, })
  map(
    'n', '<C-b>', [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
    { noremap = true, silent = true, nowait = true, expr = true, })
  map(
    'i', '<C-f>', [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"]],
    { noremap = true, silent = true, nowait = true, expr = true, })
  map(
    'i', '<C-b>', [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"]],
    { noremap = true, silent = true, nowait = true, expr = true, })
  map(
    'v', '<C-f>', [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
    { noremap = true, silent = true, nowait = true, expr = true, })
  map(
    'v', '<C-b>', [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
    { noremap = true, silent = true, nowait = true, expr = true, })
end

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
map('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
map('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

-- Add `:Format` command to format current buffer.
vim.cmd [[
  command! -nargs=0 Format :call CocAction('format')
]]

-- Add `:Fold` command to fold current buffer.
vim.cmd [[
  command! -nargs=? Fold :call CocAction('fold', <f-args>)
]]

-- Add `:OR` command for organize imports of the current buffer.
vim.cmd [[
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
]]

-- Mappings for CoCList
-- Show all diagnostics.
map(
  'n', '<space>a', ':<C-u>CocList diagnostics<cr>',
  { noremap = true, silent = true, nowait = true })
-- Manage extensions.
map(
  'n', '<space>x', ':<C-u>CocList extensions<cr>',
  { noremap = true, silent = true, nowait = true })
-- Show commands.
map(
  'n', '<space>c', ':<C-u>CocList commands<cr>',
  { noremap = true, silent = true, nowait = true })
-- Find symbol of current document.
map(
  'n', '<space>o', ':<C-u>CocList outline<cr>',
  { noremap = true, silent = true, nowait = true })
-- Search workspace symbols.
map(
  'n', '<space>s', ':<C-u>CocList -I symbols<cr>',
  { noremap = true, silent = true, nowait = true })
-- Do default action for next item.
map(
  'n', '<space>j', ':<C-u>CocNext<cr>',
  { noremap = true, silent = true, nowait = true })
-- Do default action for previous item.
map(
  'n', '<space>k', ':<C-u>CocPrev<cr>',
  { noremap = true, silent = true, nowait = true })
-- Resume latest coc list.
map(
  'n', '<space>p', ':<C-u>CocListResume<cr>',
  { noremap = true, silent = true, nowait = true })

-- Coc snippets
-- Use <C-l> for trigger snippet expand.
map('i', '<C-l>', '<Plug>(coc-snippets-expand)', {})

vim.cmd [[
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

]]
vim.g.coc_snippet_next = '<tab>'
vim.g.coc_snippet_prev = '<S-tab>'
-- Use <leader>x for convert visual selected code to snippet
map('x', '<leader>x', '<Plug>(coc-snippets-snippet)', {})

-- Coc restclient
vim.cmd [[
autocmd FileType http noremap <Localleader>x :CocCommand rest-client.request <cr>
]]

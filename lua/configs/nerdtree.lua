-- Map key for NERDTree
local map = vim.api.nvim_set_keymap
map('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

-- Start NERDTree when Vim starts with a directory argument.
-- autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
--       \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.cmd [[
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
]]

-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd [[
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]]
-- Close the tab if NERDTree is the only window remaining in it.
vim.cmd [[
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]]

-- Open the existing NERDTree on each new tab.
-- vim.cmd [[
-- autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
-- ]]

-- NERDTree git status
vim.g.NERDTreeGitStatusUseNerdFonts = 1 -- you should install nerdfonts by yourself. default: 0
vim.g.NERDTreeGitStatusShowIgnored = 1 -- a heavy feature may cost much more time. default: 0
vim.g.NERDTreeGitStatusConcealBrackets = 1 -- default: 0

vim.g.NERDTreeLimitedSyntax = 1 -- Mitigating lag issue by remove hightligh uncommon icons

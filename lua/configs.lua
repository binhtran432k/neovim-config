-- Color scheme
vim.opt.termguicolors = true -- Make terminal use colorscheme
vim.opt.background = 'dark'
vim.cmd [[
  syntax on
  colorscheme dracula
]]

-- Column ruler
vim.opt.colorcolumn = { 80, 100, 120 }

-- Font 
local is_windows = vim.loop.os_uname().version:match("Windows")
if is_windows then
  vim.g.guifont = 'Delugia:h12' -- Powerline font
end

-- Search case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor
-- vim.opt.cursorcolumn = true
vim.opt.cursorline = true
-- Cursor shape
vim.opt.guicursor = 'n-c:block,i-ci-ve:ver40,r-cr-v:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- Mouse selection
vim.opt.mouse = 'a'

-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Fold indent
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99

-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Save last cursor position and folding
vim.opt.viewoptions = vim.opt.viewoptions - 'options'
vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
    autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
  augroup END
]]

-- Auto reload content changed outside
-- vim.cmd [[
-- au CursorHold,CursorHoldI * checktime
-- au FocusGained,BufEnter * :checktime
-- autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
--   \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
-- autocmd FileChangedShellPost *
--   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
-- ]]

-- Disable automatic comment in newline
-- vim.cmd [[
-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
-- ]]

-- Increment priority
vim.opt.nrformats = { 'alpha', 'bin', 'hex' }

require('configs.airline')
require('configs.camel-case-motion')
require('configs.coc')
require('configs.fzf')
require('configs.ibus')
require('configs.indent-blankline')
require('configs.indent-o-matic')
require('configs.keymap')
require('configs.neoranger')
require('configs.nerdtree')
require('configs.floaterm')
require('configs.vimspector')
require('configs.vimtex')

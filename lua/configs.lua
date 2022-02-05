_G.rainbow_colors = {
  'Error',
  'String',
  'Function',
  'Type',
  'Constant',
  'Keyword',
  'SpellLocal',
}

local options = {
  -- (( Color scheme ))
  termguicolors = true,
  background = 'dark',
  -- (( Column ruler ))
  colorcolumn = { 80, 100, 120 },
  -- (( Search case ))
  ignorecase = true,
  smartcase = true,
  -- (( Cursor ))
  -- cursorcolumn = true,
  cursorline = true,
  -- (( Cursor shape ))
  -- guicursor = 'n-c:block,i-ci-ve:ver40,r-cr-v:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175',
  guicursor = 'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor',
  -- (( Mouse selection ))
  mouse = 'a',
  -- (( Indent ))
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smarttab = true,
  -- (( Fold indent ))
  -- foldmethod = 'indent',
  -- foldlevelstart = 99,
  fillchars = 'fold: ',
  foldmethod = 'expr',
  foldlevel = 99,
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldtext = [[substitute(getline(v:foldstart),'\\\\t',repeat('\\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']],
  -- (( Increment priority ))
  nrformats = { 'alpha', 'bin', 'hex' },
  -- (( Line number ))
  number = true,
  relativenumber = true,
  -- (( LSP ))
  -- unicode characters in the file autoload/float.vim
  encoding = 'utf-8',
  -- TextEdit might fail if hidden is not set.
  hidden = true,
  -- Some servers have issues with backup files, see #649.
  backup = false,
  writebackup = false,
  -- Give more space for displaying messages.
  cmdheight = 2,
  showmode = false,
  -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  -- delays and poor user experience.
  updatetime = 250,
  -- (( Split window ))
  splitbelow = true,
  splitright = true,
  -- (( Spelling ))
  -- spell = true,
  -- spelllang = { 'en_us', 'vi' },
  -- spelloptions = 'camel',
  -- spellcapcheck = '', -- better for code checking
  -- spellfile = 'en.utf-8.add',
  -- (( Others ))
  signcolumn = 'yes', -- display sign in column
  wrap = false, -- no wrap for long text
  scrolloff = 8, -- make cursor in middle
  sidescrolloff = 8,
  timeoutlen = 200, -- for which key
}

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append('c')

-- Highlight problematic whitespace, NOTE: Disable when terminal cursor is auto
vim.opt.list = true
vim.opt.listchars:append('tab:▸·')
vim.opt.listchars:append('trail:•')
-- vim.opt.listchars:append('tab:y ')
-- vim.opt.listchars:append('trail:•')
-- vim.opt.listchars:append('extends:#')
-- vim.opt.listchars:append('nbsp:.')
-- vim.opt.listchars:append('space:⋅')
-- vim.opt.listchars:append('eol:↴')

-- vim.opt.listchars:append('tab:> ')
-- vim.opt.listchars:append('space:.')

-- Font
local is_windows = vim.loop.os_uname().version:match('Windows')
if is_windows then
  vim.g.guifont = 'Delugia:h12' -- Powerline font
end

-- Save last cursor position and folding
vim.opt.viewoptions:remove('options')
vim.cmd [[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
  autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
augroup END
]]

-- Auto reload content changed outside
vim.cmd [[
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]

-- Disable automatic comment in newline
-- vim.cmd [[
-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
-- ]]

for k, v in pairs(options) do
  vim.opt[k] = v
end

require('packer_compiled')
require('plugins.impatient')
require('plugins.project')
require('plugins.colorscheme')
require('plugins.transparent')
require('plugins.treesitter')
require('plugins.alpha')
require('plugins.iswap')
require('plugins.comment')
require('plugins.surround')
require('plugins.camel-case-motion')
require('plugins.neoscroll')
require('plugins.matchup')
require('plugins.which-key')
require('plugins.colorizer')
require('plugins.todo-comments')
require('plugins.hop')
require('plugins.indent-blankline')
require('plugins.indent-o-matic')
require('plugins.gitsigns')
require('plugins.git-blame')
require('plugins.telescope')
require('plugins.trouble')
require('plugins.toggleterm')
require('plugins.tree')
require('lsp.init')
require('plugins.cmp')
require('plugins.autopairs')
require('plugins.lualine')
require('plugins.bufferline')
require('plugins.vimtex')

-- require('configs.vimspector')

-- Fix highlight
vim.cmd [[
highlight Whitespace guifg=#fff
]]

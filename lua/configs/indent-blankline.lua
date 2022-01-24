-- Highlight problematic whitespace
vim.opt.list = true
vim.opt.listchars:append('tab:› ')
vim.opt.listchars:append('trail:•')
vim.opt.listchars:append('extends:#')
vim.opt.listchars:append('nbsp:.')
vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')

-- vim.opt.listchars:append('tab:> ')
-- vim.opt.listchars:append('space:.')

-- Rainbow Indent
require('indent_blankline').setup {
  space_char_blankline = ' ',
  char_highlight_list = {
    'Error',
    'String',
    'Function',
    'Type',
    'Keyword',
    'Constant',
  },
  show_trailing_blankline_indent = false,
  filetype_exclude = { 'help', 'nerdtree' },
  buftype_exclude = { 'terminal' },
}

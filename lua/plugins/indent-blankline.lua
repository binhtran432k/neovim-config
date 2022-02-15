local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

indent_blankline.setup({
  char = '┊',
  space_char_blankline = ' ',
  char_highlight_list = _G.rainbow_colors,
  show_trailing_blankline_indent = false,
  filetype_exclude = { 'help', 'packer', 'nerdtree', 'NvimTree' },
  buftype_exclude = { 'terminal', 'nofile' },
})

-- Tabbar
vim.g.airline_powerline_fonts = 1

vim.g['airline#extensions#tabline#enabled'] = 1 -- Enable Tab bar

-- vim.g.airline_left_sep = '▓▒░'
-- vim.g.airline_right_sep = '░▒▓'
vim.g.airline_left_sep = '▒'
vim.g.airline_left_alt_sep = '│'
vim.g.airline_right_sep = '▒'
vim.g.airline_right_alt_sep = '│'

-- vim.g.airline#extensions#tabline#left_sep = '' -- Enable Tab seperator 
-- vim.g.airline#extensions#tabline#left_alt_sep = '|' -- Enable Tab seperator
-- vim.g.airline#extensions#tabline#formatter = 'default'
-- vim.g.airline#extensions#tabline#fnamemod = ':t' -- Set Tab name as file name

vim.g['airline#extensions#whitespace#enabled'] = 0 -- Remove warning whitespace

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
vim.opt.statusline:prepend([[%{coc#status()}%{get(b:,'coc_current_function','')}]])
-- Disable vim-airline integration:
vim.g['airline#extensions#coc#enabled'] = 0
-- Change error symbol:
vim.g['airline#extensions#coc#error_symbol'] = 'Error:'
-- Change warning symbol:
vim.g['airline#extensions#coc#warning_symbol'] = 'Warning:'
-- Change error format:
vim.g['airline#extensions#coc#stl_format_err'] = '%E{[%e(#%fe)]}'
-- Change warning format:
vim.g['airline#extensions#coc#stl_format_warn'] = '%W{[%w(#%fw)]}'

vim.g.floaterm_position = 'topright'
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_title = 'Terminal $1/$2'
vim.g.floaterm_wintype = 'float'
vim.g.floaterm_rootmarkers = {'.pro'}
if vim.fn.has('win32') == 1 then
  vim.g.floaterm_shell = 'powershell -nologo'
end

-- Set color
-- vim.cmd [[
-- hi Floaterm guibg=Grey15
-- hi FloatermBorder guifg=LightPink guibg=DarkViolet
-- hi FloatermNC guibg=darkred
-- ]]


-- Hotkey to manage terminals
-- Open a new terminal 
vim.g.floaterm_keymap_new    = '<leader>to'
-- Kill current terminal 
vim.g.floaterm_keymap_kill    = '<leader>tk'
-- Navigation next and previous terminal 
vim.g.floaterm_keymap_next   = '<leader>tn'
vim.g.floaterm_keymap_prev   = '<leader>tp'

-- Toggle terminal
vim.g.floaterm_keymap_toggle = '<leader>tt'

-- Focus terminal 
-- nnoremap <silent>   <leader>tf      <C-\><C-n><C-W><Left>
-- tnoremap <silent>   <leader>tf      <C-\><C-n><C-W><Left>

-- This is the default extra key bindings
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-i'] = 'split',
  ['ctrl-s'] = 'vsplit'
}

-- - Popup window (anchored to the bottom of the current window)
vim.g.fzf_layout = { window = { width = 0.8, height = 0.6, relative = true } }

-- Customize fzf colors to match your color scheme
-- - fzf#wrap translates this to a set of `--color` options
vim.g.fzf_colors = {
  ['fg'] = {'fg', 'Normal'},
  ['bg'] = {'bg', 'Normal'},
  ['hl'] = {'fg', 'Comment'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  ['info'] = {'fg', 'PreProc'},
  ['border'] = {'fg', 'Ignore'},
  ['prompt'] = {'fg', 'Conditional'},
  ['pointer'] = {'fg', 'Exception'},
  ['marker'] = {'fg', 'Keyword'},
  ['spinner'] = {'fg', 'Label'},
  ['header'] = {'fg', 'Comment'}
}

vim.api.nvim_set_keymap('n', '<leader>ee', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>eh', ':History<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>eb', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>et', ':Windows<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>eg', ':Ag<CR>', { noremap = true, silent = true })

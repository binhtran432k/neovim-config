  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
  vim.api.nvim_set_keymap('n', ']d', "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
  vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

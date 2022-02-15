local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup({
  size = vim.o.columns * 0.4, -- 15,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'vertical', -- 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})

-- cSpell:ignore set_terminal_keymaps
function _G.set_terminal_keymaps()
  local opts = { noremap = true, silent = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  -- Alternative map
  vim.api.nvim_set_keymap(
    't',
    [[<M-\>]],
    [[<C-\><C-n><Cmd>exe "2ToggleTerm"<CR>]],
    { noremap = true, silent = true }
  )
  -- Resize
  vim.api.nvim_buf_set_keymap(
    0,
    't',
    '<M-h>',
    [[<C-\><C-n><Cmd>vertical resize -4<CR>i]],
    opts
  )
  vim.api.nvim_buf_set_keymap(
    0,
    't',
    '<M-j>',
    [[<C-\><C-n><Cmd>resize -4<CR>i]],
    opts
  )
  vim.api.nvim_buf_set_keymap(
    0,
    't',
    '<M-k>',
    [[<C-\><C-n><Cmd>resize +4<CR>i]],
    opts
  )
  vim.api.nvim_buf_set_keymap(
    0,
    't',
    '<M-l>',
    [[<C-\><C-n><Cmd>vertical resize +4<CR>i]],
    opts
  )
  -- Fix spell check
  vim.o.spell = false
end

-- Alternative map
vim.api.nvim_set_keymap(
  'n',
  [[<M-\>]],
  [[<Cmd>exe "2ToggleTerm"<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'i',
  [[<M-\>]],
  [[<Esc><Cmd>exe "2ToggleTerm"<CR>]],
  { noremap = true, silent = true }
)

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

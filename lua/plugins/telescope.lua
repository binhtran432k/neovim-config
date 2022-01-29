local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
      },
    },
  },
}

-- Enable telescope fzf native
telescope.load_extension('fzf')

-- Default mapping
vim.api.nvim_set_keymap('n', '<leader>ff',
  '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg',
  '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb',
  '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh',
  '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true })

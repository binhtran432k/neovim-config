local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup()
vim.api.nvim_set_keymap("", "S", "<Cmd>HopWord<CR>", { silent = true })

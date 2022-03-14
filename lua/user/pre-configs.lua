local M = {}

function M.setup()
  vim.opt.compatible = false
  vim.g.polyglot_disabled = { 'autoindent', 'sensible' }
end

return M

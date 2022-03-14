local M = {}

function M.get_user_plugin(plugin_name)
  return require('user.plugins.' .. plugin_name)
end

function M.get_user_lsp_module(lsp_module)
  return require('user.lsp.' .. lsp_module)
end

function M.get_user_dap_module(dap_module)
  return require('user.dap.' .. dap_module)
end

return M

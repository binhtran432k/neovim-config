local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_filetypes = { 'toml', 'solidity' },
      extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
    }),
    formatting.black.with({ extra_args = { '--fast' } }),
    formatting.stylua,
    diagnostics.cspell.with({
      extra_args = { '--locale', '"en, vi"', '--unique' },
    }),
  },
  should_attach = function(bufnr)
    local file_type = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    for _, disable_ft in ipairs(_G.special_file_types) do
      if file_type == disable_ft then
        return false
      end
    end
    return true
  end,
  fallback_severity = vim.diagnostic.severity.HINT,
})

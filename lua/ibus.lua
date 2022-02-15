local M = {}

vim.g.ibus_us_engine = 'BambooUs::Candy'

function M.trigger_ibus_off()
  -- Save current engine
  vim.g.ibus_prev_engine = vim.fn.system('ibus engine')
  -- Change engine to English (US)
  vim.cmd([[silent! execute '!ibus engine ' . g:ibus_us_engine]])
end

function M.trigger_ibus_on()
  -- Get current engine
  local current_engine = vim.fn.system('ibus engine')
  -- Restore previous engine
  vim.cmd([[silent! execute '!ibus engine ' . g:ibus_prev_engine]])
  -- Assign previous engine if current engine is not English (US)
  if current_engine ~= vim.g.ibus_us_engine then
    vim.g.ibus_prev_engine = current_engine
  end
end

vim.cmd([[
augroup ibus_handler
  " Restore engine for search
  autocmd CmdLineEnter [/?] silent lua require('ibus').trigger_ibus_on()
  autocmd CmdLineLeave [/?] silent lua require('ibus').trigger_ibus_off()
  autocmd CmdLineEnter \? silent lua require('ibus').trigger_ibus_on()
  autocmd CmdLineLeave \? silent lua require('ibus').trigger_ibus_off()
  " Restore engine if enter insert mode
  autocmd InsertEnter * silent lua require('ibus').trigger_ibus_on()
  " Make engine to English if leave insert mode
  autocmd InsertLeave * silent lua require('ibus').trigger_ibus_off()
  " Make engine off in startup
  autocmd VimEnter * silent lua require('ibus').trigger_ibus_off()
augroup END
]])

return M

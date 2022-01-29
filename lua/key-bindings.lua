local M = {}

local map = vim.api.nvim_set_keymap
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Default key leader
vim.g.mapleader = ','
vim.g.maplocalleader = ';'

-- Fix leader in terminal
map('t', '<leader>,', ',', { noremap = true })

-- Real tab in insert
map('i', '<S-Tab>', '<C-V><Tab>', { noremap = true })

-- Window moving
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- Resize pane
local ns_opt = { noremap = true, silent = true, }
map('n', '<M-h>', '<Cmd>vertical resize -4<CR>', ns_opt)
map('n', '<M-j>', '<Cmd>resize -4<CR>', ns_opt)
map('n', '<M-k>', '<Cmd>resize +4<CR>', ns_opt)
map('n', '<M-l>', '<Cmd>vertical resize +4<CR>', ns_opt)

-- Search a highlighted text
map('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true })

-- Search a highlighted text
map('v', 'ae', 'ymzggVG', { noremap = true })
map('o', 'ae', '<Cmd>normal! mzggVG<CR>`z', { noremap = true, silent = true })

-- Remove Highlight text when press <cr> if there is
function M.smart_remove_highlight()
  if vim.opt.hlsearch['_value'] and vim.v.hlsearch == 1 then
    return t':<C-u>nohl<CR>'
  else
    return t'<CR>'
  end
end

map('n', '<CR>', 'v:lua.require("key-bindings").smart_remove_highlight()',
  { expr = true, noremap = true, silent = true })

-- Paste with formatting
map('n', '<C-p>', 'p`[v`]=', { noremap = true })

-- Toggle Spelling
map('n', '<C-Space>', '<Cmd>set spell!<CR>', ns_opt)

return M

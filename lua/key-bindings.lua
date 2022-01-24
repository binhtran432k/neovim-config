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
-- map('n', '<C-h>', '<C-w>h', { noremap = true })
-- map('n', '<C-j>', '<C-w>j', { noremap = true })
-- map('n', '<C-k>', '<C-w>k', { noremap = true })
-- map('n', '<C-l>', '<C-w>l', { noremap = true })

-- Resize pane
map('n', '<M-Right>', ':<C-u>vertical resize +1<CR>', {
    noremap = true,
    silent = true,
  })
map('n', '<M-Left>', ':<C-u>vertical resize -1<CR>', {
    noremap = true,
    silent = true,
  })
map('n', '<M-Down>', ':<C-u>resize +1<CR>', {
    noremap = true,
    silent = true,
  })
map('n', '<M-Up>', ':<C-u>resize -1<CR>', {
    noremap = true,
    silent = true,
  })

-- Search a hightlighted text
map('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true })

-- DeHighlight text after press <cr>
function _G.smartDehighlight()
  if vim.opt.hlsearch['_value'] and vim.v.hlsearch == 1 then
    return t':<C-u>nohl<CR>'
  else
    return t'<CR>'
  end
end
map('n', '<CR>', 'v:lua.smartDehighlight()', {
    expr = true, noremap = true, silent = true
  })

-- Paste with formating
map('n', '<C-p>', 'p`[v`]=', { noremap = true })

-- cSpell:words prepended
local M = {}
local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = 'Comments' },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = 'rounded', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = 'center', -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = 'auto', -- automatically setup triggers
  -- triggers = {"g?"}, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
}

-- Fugitive
local fugitive_reg = {
  mappings = {
    s = { 'Stage' },
    u = { 'Unstage' },
    ['-'] = { 'Toggle stage' },
    U = { 'Unstage all' },
    X = { 'Discard change' },
    ['='] = { 'Toggle inline diff' },
    ['>'] = { 'Insert inline diff' },
    ['<'] = { 'Remove inline diff' },
    I = { 'git add/reset --patch' },
    d = {
      name = '+Diff',
      p = { 'git diff' },
      d = { 'git diff split' },
      v = { 'git diff vsplit' },
      s = { 'git diff hsplit' },
      h = { 'git diff hsplit' },
      q = { 'Close all diff buffer' },
      ['?'] = { 'Show help' },
    },
    ['<CR>'] = { 'Open' },
    o = { 'Open split' },
    O = { 'Open tab' },
    p = { 'Preview' },
    ['~'] = { 'Open ancestor' },
    P = { 'Open parent' },
    C = { 'Open commit' },
    ['('] = { 'Jump prev' },
    [')'] = { 'Jump next' },
    ['['] = {
      name = '+Nav prev',
      c = { 'Jump prev hunk' },
      ['/'] = { 'Jump prev file + collapse diff' },
      m = { 'Jump prev file + collapse diff' },
      ['['] = { 'Jump sections backward' },
      [']'] = { 'Jump sections end backward' },
    },
    [']'] = {
      name = '+Nav next',
      c = { 'Jump next hunk' },
      ['/'] = { 'Jump next file + collapse diff' },
      m = { 'Jump next file + collapse diff' },
      [']'] = { 'Jump sections forward' },
      ['['] = { 'Jump sections end forward' },
    },
    i = { 'Jump next + expand diff' },
    ['*'] = { 'Search diff line forward' },
    ['#'] = { 'Search diff line backward' },
    g = {
      name = '+Nav',
      u = { 'Jump Untracked/Unstaged' },
      U = { 'Jump Unstaged' },
      s = { 'Jump Staged' },
      p = { 'Jump Unpushed' },
      P = { 'Jump Unpulled' },
      r = { 'Jump Rebasing' },
      i = { 'Open split .git/info/exclude' },
      I = { 'Open split .git/info/exclude + add file' },
      O = { 'Open vsplit' },
      q = { 'Close status buffer' },
      ['?'] = { 'Show help' },
    },
    c = {
      name = '+Commit',
      c = { 'Create commit' },
      a = { 'Amend commit + edit' },
      e = { 'Amend commit' },
      w = { 'Reword last commit' },
      v = {
        name = '+with -v',
        c = { 'Create commit' },
        a = { 'Amend commit + edit' },
      },
      f = { 'fixup!' },
      F = { 'fixup! + rebase' },
      s = { 'squash!' },
      S = { 'squash! + rebase' },
      A = { 'squash! + edit' },
      ['<Space>'] = { ':Git commit' },
      r = {
        name = '+Revert',
        c = { 'Revert commit' },
        n = { 'Revert commit + not actual' },
        ['<Space>'] = { ':Git revert' },
      },
      m = {
        name = '+Merge',
        ['<Space>'] = { ':Git merge' },
      },
      ['?'] = { 'Show help' },
      b = {
        name = '+Branch',
        ['<Space>'] = { ':Git branch' },
        ['?'] = { 'Show help' },
      },
      o = {
        name = '+Checkout',
        o = 'Checkout commit',
        ['<Space>'] = { ':Git checkout' },
        ['?'] = { 'Show help' },
      },
      z = {
        name = '+Stash',
        z = { 'Push stash' },
        w = { 'Push stash worktree' },
        A = { 'Apply stash' },
        a = { 'Apply stash preserve' },
        P = { 'Pop stash' },
        p = { 'Pop stash preserve' },
        ['<Space>'] = { ':Git stash' },
        ['?'] = { 'Show help' },
      },
    },
    r = {
      name = '+Rebase',
      i = { 'Rebase interactive' },
      f = { 'Rebase autosquash' },
      u = { 'Rebase interactive upstream' },
      p = { 'Rebase interactive push' },
      r = { 'Continue rebase' },
      s = { 'Skip commit + continue rebase' },
      a = { 'Abort rebase' },
      e = { 'Edit rebase' },
      w = { 'Rebase interactive reword' },
      m = { 'Rebase interactive edit' },
      d = { 'Rebase interactive drop' },
      ['<Space>'] = { ':Git rebase' },
      ['?'] = { 'Show help' },
    },
    ['.'] = { 'Start : with file' },
  },
  opts = {
    mode = 'n',
    buffer = 0,
    nowait = true,
  },
}

function M.set_key_binds()
  local file_type = vim.api.nvim_buf_get_option(0, 'filetype')

  if file_type == 'fugitive' then
    which_key.register(fugitive_reg.mappings, fugitive_reg.opts)
  end
end

which_key.setup(setup)
vim.cmd(
  'autocmd VimEnter,FileType * lua require("plugins.which-key").set_key_binds()'
)

return M

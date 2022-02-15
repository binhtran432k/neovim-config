-- cSpell:ignore latexmk zathura mupdf okular
-- Make main.tex as default latex project
vim.cmd([[
autocmd FileType tex let b:vimtex_main = 'main.tex'
]])

-- Unset callback
-- vim.g.vimtex_compiler_latexmk = {
--   callback = 0,
-- }

-- Setup default pdf viewer

-- ((Zathura))
-- vim.g.vimtex_view_general_viewer = 'zathura'
-- vim.g.vimtex_view_method = 'zathura'

-- ((MuPdf))
-- vim.g.vimtex_view_method = 'mupdf'

-- ((Okular))
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]

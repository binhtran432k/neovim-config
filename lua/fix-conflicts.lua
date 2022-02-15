-- (( Fix vimtex ))
vim.cmd([[
autocmd FileType tex xmap ae <plug>(vimtex-ae)
autocmd FileType tex xmap ie <plug>(vimtex-ie)
autocmd FileType tex xmap ac <plug>(vimtex-ac)
autocmd FileType tex xmap ic <plug>(vimtex-ic)
]])

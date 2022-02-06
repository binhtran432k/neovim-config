local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

bufferline.setup {
}

vim.cmd [[
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><leader>be :BufferLineSortByExtension<CR>
nnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><leader>bb :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
]]

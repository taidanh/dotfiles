nnoremap <Leader>g  :BufferLineCycleNext<CR>
nnoremap <Leader>a  :BufferLineCyclePrev<CR>
nnoremap <Leader>f  :BufferLineMoveNext<CR>
nnoremap <Leader>d  :BufferLineMovePrev<CR>
nnoremap <Leader>c  :b#<bar>bd#<CR>
nnoremap <Leader>bp :BufferLinePick<CR>

" run lua code here
lua << EOF
    require("bufferline").setup{}
EOF

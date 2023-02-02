" Create bufferline option dict
let bufferline = get(g:, 'bufferline', {})

" Enable bufferline diagnostics
let bufferline.diagnostics = [
  \ {'enabled': v:true, 'icon': 'ﬀ'},
  \ {'enabled': v:false},
  \ {'enabled': v:false},
  \ {'enabled': v:true},
\]

" No-name bufer set - [buffer X] by default
let bufferline.no_name_title = v:null

" Never auto-hide the bufferline
let bufferline.autohide = v:false

" Hide file extensions and prevent hiding inactive buffers
let bufferline.hide = {'extensions': v:true, 'inactive': v:false}

" Set bufferline padding and length
let bufferline.maximum_padding = 4
let bufferline.minimum_padding = 1

" Move to previous/next tab
nnoremap <silent><A-,> :BufferPrevious<CR>
nnoremap <silent><A-.> :BufferNext<CR>

" Reorder tabs
nnoremap <silent><A-<> :BufferMovePrevious<CR>
nnoremap <silent><A->> :BufferMoveNext<CR>

" Goto tab...
nnoremap <silent><A-1> :BufferGoto 1<CR>
nnoremap <silent><A-2> :BufferGoto 2<CR>
nnoremap <silent><A-3> :BufferGoto 3<CR>
nnoremap <silent><A-4> :BufferGoto 4<CR>
nnoremap <silent><A-5> :BufferGoto 5<CR>
nnoremap <silent><A-6> :BufferGoto 6<CR>
nnoremap <silent><A-7> :BufferGoto 7<CR>
nnoremap <silent><A-8> :BufferGoto 8<CR>
nnoremap <silent><A-9> :BufferLast<CR>

" Close tab
nnoremap <silent><A-q> :BufferClose<CR>


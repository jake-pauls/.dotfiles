" 'Tree' display for netrw
let g:netrw_liststyle = 3

" System clipboard remaps
func! ClipboardYank()
    call system('xclip -i -selection clipboard', @@)
endfun
func! ClipboardPaste()
    let @@ = system('xclip -o -selection clipboard')
endfun

" Yank
vnoremap <leader>y y:call ClipboardYank()<CR>
" Cut
vnoremap <leader>d d:call ClipboardYank()<CR>
" Paste
nnoremap <leader>p :call ClipboardPaste()<CR>

" ZenMode
nnoremap <leader>zm <cmd>ZenMode<CR>

" 'Tree' display for netrw
let g:netrw_liststyle = 3

" System clipboard remaps
fun! ClipboardYank()
    call system('xclip -i -selection clipboard', @@)
endfun
fun! ClipboardPaste()
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

" Toggling C/C++ Header file
fun! SwitchSourceHeader()
  let cpp = expand("%:e") == "cpp"
  let c = expand("%:e") == "c"

  if (cpp || c)
    find %:t:r.h
  else
	if (cpp)
		find %:t:r.cpp
	else
		find %:t:r.c
	endif
  endif
endfun

nmap <A-o> :call SwitchSourceHeader()<CR>

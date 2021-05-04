" Use fern for directory level navigation
fun! Hijack() abort
    let path = expand('%:p')
    if !isdirectory(path)
        return
    endif
    bwipeout %
    execute printf('Fern %s', fnameescape(path))
endfun

augroup FernHijack
  autocmd!
  autocmd BufEnter * ++nested call Hijack()
augroup END

" Fern Keybinds
fun! FernInit() abort
  nmap <buffer> n <Plug>(fern-action-new-file)
  nmap <buffer> N <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfun

augroup FernKeybinds
    autocmd!
    autocmd FileType fern call FernInit()
augroup END

" Icon Support (https://github.com/labmdalisue/fern-renderer-nerdfont.vim)
let g:fern#renderer = "nerdfont"

augroup FernGlyphs
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
augroup END

" Remaps
nnoremap <silent> <leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

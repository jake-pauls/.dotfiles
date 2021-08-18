" mode_map overrides the default mode names
let g:lightline = {
           \ 'colorscheme': 'everforest',
           \ 'active': {
           \   'left': [ [ 'mode', 'paste' ],
           \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
           \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ]]
           \ },
           \ 'component_function': {
           \   'gitbranch': 'fugitive#head',
           \   'filetype': 'FileType',
           \   'fileformat': 'FileFormat',
           \ },
           \ 'mode_map': {
           \     'V' : 'VISUAL',
           \     "\<C-v>": 'VISUAL',
           \     'c' : 'NORMAL',
           \     'S' : 'SELECT',
           \     "\<C-s>": 'SELECT',
           \ },
       \ }

fun! FileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfun

fun! FileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfun

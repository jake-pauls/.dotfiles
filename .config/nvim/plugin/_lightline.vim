let g:lightline = {
       \ 'colorscheme': 'onedark',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
       \   'right': [ [ 'lineinfo' ],
       \              [ 'filetype', 'charvaluehex' ] ]
       \ },
       \ 'component_function': {
       \   'gitbranch': 'fugitive#head',
       \ },
       \ }

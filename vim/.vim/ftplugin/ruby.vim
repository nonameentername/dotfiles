let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd FileType ruby set omnifunc=rubycomplete#Complete

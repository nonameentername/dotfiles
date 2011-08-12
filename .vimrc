syntax on
set history=1000
set number
set shiftwidth=4
set expandtab 
set tabstop=4
set hidden
set incsearch
set ignorecase
set smartcase
"set wildmenu
set wildmode=list:longest
set autoindent
set dir=/tmp
set cot-=preview

let mapleader = ","

map<C-H> <C-W>h
map<C-J> <C-W>j
map<C-K> <C-W>k
map<C-L> <C-W>l

nmap<silent><leader>N :bp<cr>
nmap<silent><leader>n :bn<cr>

map<leader>y "+y
map<leader>p "+p

nmap<leader>h :split<cr>
nmap<leader>v :vsplit<cr>
nmap<leader><tab> :buffer 

"reload
nmap<leader>r :source ~/.vimrc<cr>

"xml
function FormatXml()
    :%! export XMLLINT_INDENT='    '; xmllint --format -
    :set filetype=xml
endfunction
nmap<leader>x :exec FormatXml()<cr>

"java
nmap<leader>i :JavaImport<cr>
nmap<leader>j :JavaSearchContext<cr>

"CleverTab
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &completefunc != ''
            return "\<C-X>\<C-U>"
        elseif &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"set spell

filetype plugin on

set completeopt=longest,menuone

let g:EclimJavaSearchSingleResult = 'edit'
let g:EclimMakeLCDWarning = 1

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

autocmd FileType python set completefunc=pysmell#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"improve autocomplete menu color
highlight Pmenu ctermbg=255 gui=bold

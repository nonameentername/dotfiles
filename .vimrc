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

nmap<leader>w :w<cr>

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

let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nmap<silent><leader>m :TlistToggle<cr>

"CleverTab
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-P>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"java complete with ctrl-space
inoremap <expr> <C-Space> "<C-x><C-u>"
imap <C-@> <C-Space>

"set spell

python << eopython
import os
import sys

if os.environ.has_key('VIRTUAL_ENV'):
    path = '{0}/lib/python{1.major}.{1.minor}/site-packages'.format(os.environ['VIRTUAL_ENV'], sys.version_info)
    sys.path.append(path)
eopython

if exists('$VIRTUAL_ENV')
    autocmd FileType python source $VIRTUAL_ENV/ropevim.vim
endif

filetype plugin on

set completeopt=menuone

let g:EclimJavaSearchSingleResult = 'edit'
let g:EclimMakeLCDWarning = 1

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd FileType python set completefunc=pysmell#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"improve autocomplete menu color
highlight Pmenu ctermbg=255 gui=bold

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

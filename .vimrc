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

"Subversion
nmap<leader>st :!svn st<cr>
nmap<leader>di :!svn di <C-R>%<cr>

"xml
function FormatXml()
    :%!xmllint --format -
    :set filetype=xml
endfunction
nmap<leader>x :exec FormatXml()<cr>

"Python
pyfile ~/.vim/source.py

fun! Pcomp(ArgLead, CmdLine, CursorPos)
python << EOF
argLead   = vim.eval('a:ArgLead')
cmdLine   = vim.eval('a:CmdLine')
cursorPos = vim.eval('a:CursorPos')
result = pycomp(argLead, cmdLine, cursorPos)
vim.command('let result="{0}"'.format(result))
EOF
    return result
endfun

"OmniCppComplete
set nocp
filetype plugin on

autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
"set tags+=./tags

"javacomplete
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete 

let g:EclimJavaSearchSingleResult = 'edit'
let g:EclimMakeLCDWarning = 1

autocmd Filetype python setlocal omnifunc=pythoncomplete#Complete 

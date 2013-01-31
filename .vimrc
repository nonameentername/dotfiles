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
set path+=./**

source $HOME/.vim/vimrc/keymap.vim

let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_WinWidth = 70
nmap<silent><leader>m :TlistToggle<cr>

"set spell

filetype plugin on

set completeopt=menuone,longest

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"improve autocomplete menu color
highlight Pmenu ctermbg=4 gui=bold

highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

source $HOME/.vim/vimrc/vimdiff.vim
source $HOME/.vim/vimrc/virtualenv.vim

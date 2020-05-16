syntax on
set history=1000
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hidden
set incsearch
set ignorecase
set smartcase
"set wildmenu
set wildmode=list:longest
if exists("&wildignorecase")
    set wildignorecase
endif
set path+=**
set autoindent
set dir=/tmp
set cot-=preview
set path+=./**
set linebreak
set laststatus=2
set t_Co=256

source $HOME/.vim/vimrc/keymap.vim

let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_WinWidth = 70
nmap<silent><leader>m :TlistToggle<cr>
nnoremap <CR> :noh<CR><CR>

"set spell

filetype plugin on

set completeopt=menuone,longest

if has("autocmd")
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd BufRead,BufNewFile *.gradle set filetype=groovy
endif

"improve autocomplete menu color
highlight Pmenu ctermbg=4 gui=bold


highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

source $HOME/.vim/vimrc/vimdiff.vim
source $HOME/.vim/vimrc/virtualenv.vim

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive.git'
if has("python3")
    Plugin 'git@github.com:nonameentername/searchvim.git'
endif
"Plugin 'Rykka/InstantRst'
Plugin 'https://github.com/jgdavey/tslime.vim.git'
Plugin 'kassio/neoterm'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'jdonaldson/vaxe'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'francoiscabrol/ranger.vim'
Plugin 'powerline/powerline'
Plugin 'leafgarland/typescript-vim'
Plugin 'altercation/vim-colors-solarized'


call vundle#end()
filetype plugin indent on

map <leader>T :NERDTreeToggle<CR>

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1


vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

if has("nvim") && has("python")
    set inccommand=nosplit
    set clipboard=unnamedplus
    Plugin 'OmniSharp/omnisharp-vim'
endif

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>

if len(glob('$HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim'))
    set t_Co=16
    set background=dark
    colorscheme solarized
endif

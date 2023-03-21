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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
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
    autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
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
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive.git'
"Plugin 'Rykka/InstantRst'
Plugin 'https://github.com/jgdavey/tslime.vim.git'
Plugin 'kassio/neoterm'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'jdonaldson/vaxe'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'francoiscabrol/ranger.vim'
Plugin 'powerline/powerline'
Plugin 'leafgarland/typescript-vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'calviken/vim-gdscript3'
Plugin 'luisjure/csound-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'dense-analysis/ale'
Plugin 'LnL7/vim-nix'
Plugin 'davidhalter/jedi-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'natebosch/vim-lsc'
Plugin 'mg979/vim-visual-multi'
Plugin 'hashivim/vim-terraform'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-unimpaired'

if executable('yarn')
    Plugin 'neoclide/coc.nvim'
endif

call vundle#end()
filetype plugin indent on

nmap <leader>T :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:clang_library_path='/usr/lib/llvm-8/lib/libclang-8.0.1.so'


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

highlight CocFloating ctermbg=0

autocmd BufNewFile,BufRead *.inc set syntax=csound
set nofoldenable

autocmd StdinReadPre * setlocal buftype=nofile bufhidden=hide noswapfile

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:ale_linters = {'cs': ['OmniSharp']}

autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>

let g:lsc_server_commands = {'scala': 'metals'}
let g:lsc_auto_map = v:true

nmap<silent><leader>b :Buffer!<cr>
nmap<silent><leader>t :Tags!<cr>
nmap<silent><leader>T :Tags! <C-r>=expand("<cword>")<CR><CR>
nmap<silent><leader>f :Files!<cr>
nmap<silent><leader>s :Rg!<cr>
nmap<silent><leader>S :Rg! <C-r>=expand("<cword>")<CR><CR>
let g:ctrlp_regexp = 1

if exists("g:neovide")
    set background=light
endif

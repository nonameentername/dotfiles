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

"complete with ctrl-space
inoremap <expr> <C-Space> "<C-x><C-u>"
imap <C-@> <C-Space>

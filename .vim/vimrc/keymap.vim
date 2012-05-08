let mapleader = ","

map<C-H> <C-W>h
map<C-J> <C-W>j
map<C-K> <C-W>k
map<C-L> <C-W>l

nmap<silent><leader>N :bp<cr>
nmap<silent><leader>n :bn<cr>

vnoremap y "+y
vnoremap Y "+Y
vnoremap p "+p
vnoremap P "+P

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

function! CanComplete(method)
    if a:method == ''
        return 0
    endif

    let str=strpart(getline('.'), 0, col('.') - 1)

    let length = {a:method}(1, '')
    let str=strpart(str, length)
    let list = {a:method}(0, str)

    return len(list) != 0
endfunction

function! SuperCleverOmni()
    if CanComplete(&omnifunc)
        return "\<C-X>\<C-O>"
    elseif CanComplete(&completefunc)
        return "\<C-X>\<C-U>"
    endif

    return ""
endfunction

inoremap <C-Space> <C-R>=SuperCleverOmni()<cr>
imap <C-@> <C-Space>

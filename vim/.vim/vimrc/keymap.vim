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

nmap<leader>w :w!<cr>
nmap <leader>l :set invlist<cr>


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
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-y>" : "<TAB>"
inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "<cr>"

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

inoremap <silent><C-Space> <C-R>=SuperCleverOmni()<cr>
imap <C-@> <C-Space>

function! FormatXml()
    :%! export XMLLINT_INDENT='    '; xmllint --format -
    :set filetype=xml
endfunction
nmap<leader>x :exec FormatXml()<cr>

function! FormatJson()
    :%! jq
    :set filetype=json
endfunction
nmap<leader>j :exec FormatJson()<cr>

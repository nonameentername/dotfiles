let g:ropevim_autoimport_modules = ["sys", "os", "shutil", "django.*", "django", ]
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1

"set omnifunc=pysmell#Complete
"set completefunc=RopeOmniComplete
"set completefunc=pysmell#Complete
"set omnifunc=pythoncomplete#Complete

"<C-ENTER>
imap <NL> <C-O>:python run_these_lines()<CR>

nmap<leader>r :RopeRename<cr>
nmap<leader>i :RopeAutoImport<cr>
nmap<leader>j :RopeGotoDefinition<cr>

set colorcolumn=80

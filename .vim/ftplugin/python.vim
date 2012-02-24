set completefunc=pysmell#Complete
set omnifunc=pythoncomplete#Complete

let g:ropevim_autoimport_modules = ["sys", "os", "django.*", "django", ]

nmap<leader>r :RopeRename<cr>
nmap<leader>i :RopeAutoImport<cr>
nmap<leader>j :RopeGotoDefinition<cr>

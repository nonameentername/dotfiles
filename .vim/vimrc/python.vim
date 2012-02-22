python << eopython
import os
import sys

if os.environ.has_key('VIRTUAL_ENV'):
    path = '{0}/lib/python{1.major}.{1.minor}/site-packages'.format(os.environ['VIRTUAL_ENV'], sys.version_info)
    sys.path.append(path)
eopython

if exists('$VIRTUAL_ENV')
    source $VIRTUAL_ENV/ropevim.vim
endif

set completefunc=pysmell#Complete
set omnifunc=pythoncomplete#Complete

nmap<leader>r :RopeRename<cr>
nmap<leader>i :RopeAutoImport<cr>
nmap<leader>j :RopeGotoDefinition<cr>

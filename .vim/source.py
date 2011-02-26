import os
import sys
import vim
#sys.stdout = file('/dev/null')
#sys.stderr = file('/dev/null')
#import rlcompleter as completer
sys.path.append(os.path.join(os.path.expanduser('~'), '.vim'))
sys.path.append(os.path.join(os.path.expanduser('~'), 'usr/lib/python'))
sys.path.append(os.path.join(os.path.expanduser('~'), 'usr/lib/python2.6/site-packages'))
#from IPython.completer import Completer
from searchfile import searchfile
from searchbuffer import searchbuffer
from searchtags import searchtags
from searchgrep import searchgrep
from config import ins
#from ipython import *

vim.command('nmap<silent><leader>f :py sf = searchfile()<cr>')
vim.command('nmap<silent><leader>b :py sb = searchbuffer()<cr>')
vim.command('nmap<silent><leader>t :py st = searchtags()<cr>')
vim.command('nmap<silent><leader>s :py sg = searchgrep()<cr>')
vim.command('nmap<silent><leader>m :py run()<cr>')

config = 'manage.py'
if os.path.isfile(config):
    import setdjango

"""
def pycomp(argLead, cmdLine, cursorPos):
    try:
        comp = Completer()
        result = []

        for i in xrange(sys.maxint):
            term = comp.complete(cmdLine, i)
            if term is None:
                break
            result.append(term)
    except Exception, exception:
        return exception
    return '\n'.join(result)

def run():
    vim.command('call inputsave()')
    vim.command("let user_input = input(':','','custom,Pcomp')")
    vim.command('call inputrestore()')
"""

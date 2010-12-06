import os
import sys
import vim
sys.path.append(os.path.join(os.path.expanduser('~'), '.vim'))
sys.path.append(os.path.join(os.path.expanduser('~'), 'usr/lib/python'))
sys.path.append(os.path.join(os.path.expanduser('~'), 'usr/lib/python2.6/site-packages'))
from searchfile import searchfile
from searchbuffer import searchbuffer
from searchtags import searchtags
from searchgrep import searchgrep
from config import ins

def run():
    exec '\n'.join(vim.current.buffer)

vim.command('nmap<silent><leader>f :py sf = searchfile()<cr>')
vim.command('nmap<silent><leader>b :py sb = searchbuffer()<cr>')
vim.command('nmap<silent><leader>t :py st = searchtags()<cr>')
vim.command('nmap<silent><leader>s :py sg = searchgrep()<cr>')
vim.command('nmap<silent><leader>m :py run()<cr>')

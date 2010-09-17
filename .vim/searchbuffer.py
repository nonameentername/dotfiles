import vim
import os
import re
import sys
from subprocess import *
from searchvim import searchvim

class searchbuffer(searchvim):

    def __init__(self):
        searchvim.__init__(self, 'searchBuffer')

    def handleselect(self, line):
        vim.command('silent!edit %s' % self.lines[line])

    def getlines(self):
        result = {}

        vim.command('silent redir => stemp')
        vim.command('silent ls')
        vim.command('redir END')
        temp = vim.eval('stemp')
        
        for line in temp.splitlines():
            if len(line):
                name = line.split('"')[1]
                result[os.path.basename(name)] = name
        return result

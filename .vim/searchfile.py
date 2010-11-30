import vim
import os
import re
import sys
from subprocess import *
from searchvim import searchvim

class searchfile(searchvim):

    def __init__(self):
        searchvim.__init__(self)

    def handleselect(self, line):
        vim.command('silent!edit %s' % self.lines[line])

    def getlines(self):
        result = {}

        for root, dirs, files in os.walk('.'):
            for name in files:
                self.adddict(result, name, os.path.join(root[2:],name))
            for name in dirs:
                if name.startswith('.'):
                    dirs.remove(name)
        return result

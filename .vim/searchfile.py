import vim
import os
import re
import sys
from subprocess import *
from searchvim import searchvim

class searchfile(searchvim):

    def __init__(self):
        searchvim.__init__(self, 'searchFile')

    def handleselect(self, line):
        vim.command('silent!edit %s' % self.lines[line])

    def getlines(self):
        result = {}
        p1 = Popen(['find', '-type', 'f'], stdout=PIPE)
        for line in p1.communicate()[0].splitlines():
            result[os.path.basename(line)] = line[2:]
        return result

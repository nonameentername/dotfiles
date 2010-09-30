import vim
import os
import re
import sys
from subprocess import *
from searchvim import searchvim

class searchtags(searchvim):

    def __init__(self):
        searchvim.__init__(self, 'searchTags')

    def handleselect(self, line):
        vim.command('silent!edit %s' % self.lines[line][0])
        text = self.lines[line][1]
        text = text[2:-4]

        for i, line in enumerate(vim.current.buffer):
            if text in line:
                vim.current.window.cursor = (i+1, 0)
                break

    def getlines(self):
        result = {}

        filename = './tags'
        if os.path.isfile(filename):
            for line in open(filename).readlines():
                tokens = line.split('\t')
                self.adddict(result, tokens[0], (tokens[1], tokens[2]))

        return result

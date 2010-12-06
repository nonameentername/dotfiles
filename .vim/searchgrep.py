import vim
import os
import re
import sys
from subprocess import *
from searchvim import searchvim

class searchgrep(searchvim):

    def __init__(self):
        #from: http://vim.wikia.com/wiki/User_input_from_a_script  
        vim.command('call inputsave()')
        vim.command("let user_input = input(':')")
        vim.command('call inputrestore()')
        self.search = vim.eval('user_input')
        self.delete = False
        self.ignorelist = ['.*pyc$', '.*\.svn.*']

        if self.search:
            searchvim.__init__(self)

    def handleselect(self, line):
        vim.command('silent!edit %s' % self.lines[line][0])

        number = int(self.lines[line][1])
        vim.current.window.cursor = (number, 0)

    def getlines(self):
        result = {}

        p = Popen(['egrep', '-RIni', self.search, '.'], stdout=PIPE)

        stdout, stderr = p.communicate()
        lines = stdout.splitlines()

        for line in lines:
            tokens = line.split(':')
            self.adddict(result, line, (tokens[0], tokens[1]))

        return result

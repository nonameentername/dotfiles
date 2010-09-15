import vim
import os
from subprocess import *

class FindFile:

    def __init__(self):
        self.files = self.getfiles()
        self.name = ''
        
        vim.command('sp temp')

        w = vim.current.window

        vim.command('set cursorline')
        vim.command('setlocal buftype=nofile')
        vim.command('setlocal bufhidden=hide')
        vim.command('setlocal noswapfile')

        [self._mapchar(x) for x in range(97,123)]
        vim.command('nmap <buffer><BS> :python findFile.backspace()<cr>')
        vim.command('nmap <buffer><Enter> :python findFile.enter()<cr>')
    
        self.update()

    def _mapchar(self, num):
        vim.command('nmap <buffer>%s :python findFile.keydown("%s")<cr>' % (chr(num),chr(num)))

    def enter(self):
        self.name = vim.current.line
        self.update()
        for x in self.files:
            if x == self.name:
                vim.command('silent!bd! temp')
                vim.command('silent!edit %s' % self.files[x])

    def backspace(self):
        self.name = self.name[:-1]
        self.update()

    def keydown(self, char):
        self.name += char
        self.update()

    def update(self):
        vim.current.buffer[:] = None
        vim.current.buffer[0] = self.name
        [vim.current.buffer.append(x) for x in self.files if self.name in x]

    def getfiles(self):
        result = {}
        p1 = Popen(['find', '-type', 'f'], stdout=PIPE)
        for x in p1.communicate()[0].splitlines():
            result[os.path.basename(x)] = x[2:]
        return result

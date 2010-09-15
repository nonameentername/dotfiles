import vim
import os
import re
from subprocess import *

class FindFile:

    def __init__(self):
        self.files = self.getfiles()
        self.name = ''
        
        vim.command('sp FindFile')
        self.w = vim.current.window
        self.b = vim.current.buffer

        vim.command('set cursorline')
        vim.command('setlocal buftype=nofile')
        vim.command('setlocal bufhidden=hide')
        vim.command('setlocal noswapfile')

        vim.command('nmap <buffer><BS> :python findFile.backspace()<cr>')
        vim.command('nmap <buffer><Enter> :python findFile.enter()<cr>')
        vim.command('nmap <buffer><Esc> :python findFile.exit()<cr>')

        for char in '*._-^$':
            vim.command('nmap <buffer>%s :python findFile.keydown("%s")<cr>' % (char,char))

        for num in range(0,10):
            vim.command('nmap <buffer>%s :python findFile.keydown("%s")<cr>' % (num,num))

        for num in range(97,123):
            vim.command('nmap <buffer>%s :python findFile.keydown("%s")<cr>' % (chr(num),chr(num)))

        for num in range(97,123):
            vim.command('nmap <buffer><S-%s> :python findFile.keydown("%s".upper())<cr>' % (chr(num),chr(num)))
    
        self.update()

    def exit(self):
        vim.command('silent!bd! FindFile')

    def enter(self):
        self.name = vim.current.line
        self.update()
        vim.command('silent!bd! FindFile')
        vim.command('silent!edit %s' % self.files[self.name])

    def backspace(self):
        self.name = self.name[:-1]
        self.update()

    def keydown(self, char):
        self.name += char
        self.update()

    def update(self):
        self.b[:] = None
        self.b[0] = self.name

        def validate(reg, line):
            if reg.islower():
                return re.search(reg, line, re.IGNORECASE)
            else:
                return re.search(reg, line)

        [self.b.append(x) for x in self.files if validate(self.name, x)]
        self.w.cursor = (1, len(self.name))

    def getfiles(self):
        result = {}
        p1 = Popen(['find', '-type', 'f'], stdout=PIPE)
        for x in p1.communicate()[0].splitlines():
            result[os.path.basename(x)] = x[2:]
        return result

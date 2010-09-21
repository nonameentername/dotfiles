import vim
import os
import re
from subprocess import *

class searchvim:

    def __init__(self, buffername):
        self.buffername = buffername
        self.lines = self.getlines()
        self.name = ''
        
        vim.command('sp %s' % buffername)
        self.w = vim.current.window
        self.b = vim.current.buffer

        vim.command('set cursorline')
        vim.command('setlocal buftype=nofile')
        vim.command('setlocal bufhidden=hide')
        vim.command('setlocal noswapfile')

        vim.command('nmap <silent><buffer><BS> :python %s.backspace()<cr>' % buffername)
        vim.command('nmap <silent><buffer><Enter> :python %s.enter()<cr>' % buffername)
        vim.command('nmap <silent><buffer><Esc> :python %s.exit()<cr>' % buffername)

        for char in '*._-^$':
            vim.command('nmap <silent><buffer>%s :python %s.keydown("%s")<cr>' % (char, buffername, char))

        for num in range(0,10):
            vim.command('nmap <silent><buffer>%s :python %s.keydown("%s")<cr>' % (num, buffername, num))

        for num in range(97,123):
            vim.command('nmap <silent><buffer>%s :python %s.keydown("%s")<cr>' % (chr(num), buffername, chr(num)))

        for num in range(97,123):
            vim.command('nmap <silent><buffer><S-%s> :python %s.keydown("%s".upper())<cr>' % (chr(num), buffername, chr(num)))
    
        self.update()

    def exit(self):
        vim.command('silent!bd! %s' % self.buffername)

    def enter(self):
        self.name = vim.current.line
        self.update()
        vim.command('silent!bd! %s' % self.buffername)
        self.handleselect(self.name)

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

        [self.b.append(line) for line in sorted(self.lines) if validate(self.name, line)]
        if len(self.b) == 2:
            self.b[0] = self.b[1]
        self.w.cursor = (1, len(self.name))

    def adddict(self, d, key, value):
        if d.has_key(key):
            i = 1
            while d.has_key('%s [%s]' % (key,i)):
                i+=1
            d['%s [%s]' % (key,i)] = value
        else:
            d[key] = value

    def getlines(self):
        pass

    def handleselect(self, lineindex):
        pass

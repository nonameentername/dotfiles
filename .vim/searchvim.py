import vim
import os
import re
from subprocess import *
from config import ins

class searchvim:

    def __init__(self):
        self.name = self.__class__.__name__
        self.lines = self.getlines()
        self.searchname = ''
        self.delete = True
        ins[self.name] = self

        vim.command('e %s' % self.name)
        self.w = vim.current.window
        self.b = vim.current.buffer

        vim.command('setlocal buftype=nofile')
        vim.command('setlocal bufhidden=hide')
        vim.command('setlocal noswapfile')

        vim.command('nmap <silent><buffer><BS> :py ins["%s"].backspace()<cr>' % self.name)
        vim.command('nmap <silent><buffer><Enter> :py ins["%s"].enter()<cr>' % self.name)
        vim.command('nmap <silent><buffer><Esc> :py ins["%s"].exit()<cr>' % self.name)

        for char in '*._-^$':
            vim.command('nmap <silent><buffer>%s :py ins["%s"].keydown("%s")<cr>' % (char, self.name, char))

        for num in range(0,10):
            vim.command('nmap <silent><buffer>%s :py ins["%s"].keydown("%s")<cr>' % (num, self.name, num))

        for num in range(97,123):
            vim.command('nmap <silent><buffer>%s :py ins["%s"].keydown("%s")<cr>' % (chr(num), self.name, chr(num)))

        for num in range(97,123):
            vim.command('nmap <silent><buffer><S-%s> :py ins["%s"].keydown("%s".upper())<cr>' % (chr(num), self.name, chr(num)))
    
        self.update()

    def exit(self):
        vim.command('silent!bd! %s' % self.name)

    def enter(self):
        if self.w.cursor[0] > 1 or self.b[0] == self.b[1]:
            self.handleselect(self.b[self.w.cursor[0]-1])
            if self.delete:
                vim.command('silent!bd! %s' % self.name)

    def backspace(self):
        self.searchname = self.searchname[:-1]
        self.update()

    def keydown(self, char):
        self.searchname += char
        self.update()

    def update(self):
        self.b[:] = None
        self.b[0] = self.searchname

        def validate(reg, line):
            try:
                if reg.islower():
                    return re.search(reg, line, re.IGNORECASE)
                else:
                    return re.search(reg, line)
            except:
                return False

        [self.b.append(line) for line in sorted(self.lines) if validate(self.searchname, line)]
        if len(self.b) == 2:
            self.b[0] = self.b[1]
        self.w.cursor = (1, len(self.searchname))

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

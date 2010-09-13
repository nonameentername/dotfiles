import datetime
import operator
import os
import re
import sys
import traceback
from threading import Thread, Timer
from subprocess import *

import wmiirc
from wmiirc import *

def start(name):
    tempfile = '/tmp/wmiitmp'
    os.system('ps aux | grep %s | grep -v grep > %s' % (name, tempfile))
    file = open(tempfile, 'r')

    if not file.readlines():
        os.system('%s &' % name)

def terminal():
    p1 = Popen(['screen', '-ls'], stdout=PIPE)
    output = p1.communicate()[0].splitlines()
    screen_running = False
    if output[0] == "There is a screen on:":
        for line in output[1:]:
            if 'ubuntu-session' in line: screen_running = True
    if screen_running:
        os.system('screen -x ubuntu-session -X screen -t new')
        os.system('screen -x ubuntu-session -X other')
        os.system('x-terminal-emulator -e "screen -x ubuntu-session -p new"')
        os.system('screen -x ubuntu-session -p new -X title "bash"')
    else:
        os.system('x-terminal-emulator -e "screen -S ubuntu-session" &')

background = '#333333'
floatbackground='#222222'

wmii['font'] = 'drift,-*-fixed-medium-r-*-*-12-*-*-*-*-*-*-*'
wmii['normcolors'] = '#000000', '#ffffff', '#0a67a3'
wmii['focuscolors'] = '#ffffff', '#0a67a3', '#000000'
wmii['border'] = 0

firefox = 'wmiir', 'setsid', 'firefox', '.'

keys.bind('main', (
    ('%(mod)s-Return', "Launch a terminal",
        lambda k: terminal()),
    ('%(mod)s-space',      "Open program menu",
        lambda k: program_menu()),
    ('%(mod)s-p', "Move to the view to the right",
        lambda k: tags.select(tags.next(True))),
    ('%(mod)s-Shift-p', "Move to the view to the right, take along current client",
        lambda k: tags.select(tags.next(True), take_client=Client('sel'))),
    ('%(mod)s-b',     "Toggle between floating and managed layers",
        lambda k: Tag('sel').select('toggle')),
    ('%(mod)s-Shift-b',     "Toggle selected client between floating and managed layers",
        lambda k: Tag('sel').send(Client('sel'), 'toggle')),
    ('%(mod)s-w', "Launch a firefox",
        lambda k: call(*firefox, background=True)),
))

@defmonitor
def time(self):
    return wmii.cache['focuscolors'], datetime.datetime.now().strftime('%a %b %d %I:%M:%S %Y')

wmii.tagrules = (
    ('Firefox.*', 'home'),
    ('Pidgin', 'pidgin'),
    ('Evolution', 'mail'),
)

start('gnome-settings-daemon')
start('pidgin')
start('evolution')
start('firefox')

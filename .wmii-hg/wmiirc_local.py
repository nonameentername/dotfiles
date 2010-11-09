import datetime
import operator
import os
import re
import sys
import traceback
from threading import Thread, Timer
from subprocess import *
import time

import wmiirc
from wmiirc import *

def start(name):
    p1 = Popen(['ps', 'aux'], stdout=PIPE)
    p2 = Popen(['grep', name], stdin=p1.stdout, stdout=PIPE)
    p3 = Popen(['grep', '-v', 'grep'], stdin=p2.stdout, stdout=PIPE)
    output = p3.communicate()[0].splitlines()
    if not output:
        os.system('%s &' % name)

def terminal():
    title = datetime.datetime.now().strftime('%I%M%S')
    p1 = Popen(['screen', '-ls'], stdout=PIPE)
    p2 = Popen(['grep', 'ubuntu-session'], stdin=p1.stdout, stdout=PIPE)
    output = p2.communicate()[0]
    if output:
        screen_running = True
    else:
        screen_running = False
    if screen_running:
        os.system('screen -x ubuntu-session -X screen -t %s' % title)
        os.system('screen -x ubuntu-session -X other')
        os.system('x-terminal-emulator -e "screen -x ubuntu-session -p %s" &' % title)
    else:
        os.system('x-terminal-emulator -e "screen -S ubuntu-session -t %s" &' % title)

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

#start('gnome-settings-daemon')
#start('pidgin')
#start('firefox')
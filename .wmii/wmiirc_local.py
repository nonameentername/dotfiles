import datetime
import operator
import os
import re
import sys
import traceback
from threading import Thread, Timer

import wmiirc
from wmiirc import *

def start(name, tag='home'):
    tempfile = '/tmp/wmiitmp'
    os.system('ps aux | grep %s | grep -v grep > %s' % (name, tempfile))
    file = open(tempfile, 'r')

    if not file.readlines():
        os.system('%s &' % name)

background = '#333333'
floatbackground='#222222'

wmii['font'] = 'drift,-*-fixed-medium-r-*-*-12-*-*-*-*-*-*-*'
wmii['normcolors'] = '#000000', '#ffffff', '#0a67a3'
wmii['focuscolors'] = '#ffffff', '#0a67a3', '#000000'
wmii['border'] = 0

firefox = 'wmiir', 'setsid', 'firefox', '.'

keys.bind('main', (
    ('%(mod)s-w', "Launch a firefox",
        lambda k: call(*firefox, background=True)),
))

@defmonitor
def time(self):
    return wmii.cache['focuscolors'], datetime.datetime.now().strftime('%a %b %d %I:%M:%S %Y')

start('gnome-settings-daemon')
#start('pidgin', 'pidgin')
#start('evolution', 'mail')
#start('firefox')

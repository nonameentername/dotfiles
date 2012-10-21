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

background = '#333333'
floatbackground='#222222'

wmii['font'] = 'drift,-*-fixed-medium-r-*-*-12-*-*-*-*-*-*-*'

# Colors tuples: "<text> <background> <border>"
wmii['focuscolors'] = '#ffffff', '#555555', '#777777'
wmii['normcolors'] = '#bbbbbb', '#222222', '#000000'
wmii['border'] = 1

keys.bind('main', (
    "Tag actions",
    ('%(mod)s-slash',       "Change to another tag",
        lambda k: tags.select(tag_menu())),
    ('%(mod)s-Shift-slash', "Retag the selected client",
        lambda k: setattr(Client('sel'), 'tags', tag_menu())),
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
))

@defmonitor
def time(self):
    return wmii.cache['focuscolors'], datetime.datetime.now().strftime('%a %b %d %I:%M:%S %Y')

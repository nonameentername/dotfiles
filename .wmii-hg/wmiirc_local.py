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
wmii['alertcolors'] = '#ff0000', '#222222', '#777777'
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

def get_battery_status(percent):
        equal = '=' * (int(percent) / 10)
        minus = '-' * (10 - int(percent) / 10)
        return '[%s%s] %d.0' % (equal, minus, percent)

@defmonitor
def battery(self):
    power_dir = '/sys/class/power_supply/BAT0/'

    if os.path.exists(power_dir):
        charge_now_filename = os.path.join(power_dir, 'charge_now')
        charge_now = open(charge_now_filename).readline().strip()

        charge_full_filename = os.path.join(power_dir, 'charge_full')
        charge_full = open(charge_full_filename).readline().strip()

        percent = min((float(charge_now) / float(charge_full) * 100), 100.0)

        battery_status = get_battery_status(percent)

        if percent < 10:
            return wmii.cache['alertcolors'], battery_status
        else:
            return wmii.cache['focuscolors'], battery_status
    else:
        return wmii.cache['focuscolors'], get_battery_status(100)

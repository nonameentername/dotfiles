#!/usr/bin/env python

import json
import os
import subprocess
import sys

settings = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'settings.json')

f = open(settings, 'r')
display = json.load(f)
print display

def window_in_display(window, display):
    return int(window['x']) >= int(display['x']) and int(window['x']) + int(window['width']) <= int(display['x']) + int(display['width'])

def split_lines(lines):
    return [line for line in lines.split('\n') if len(line.strip()) > 0]

def execute(command):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    stdout, stderr = process.communicate()
    return split_lines(stdout), stderr

def get_windows(desktop=0):
    stdout, stderr = execute('xdotool search --desktop %s ""' % desktop)
    return sorted(stdout)

def get_window(window_id):
    stdout, stderr = execute('xdotool getwindowgeometry --shell %s ""' % window_id)

    result = {}
    for line in stdout:
        tokens = line.split('=')
        result[tokens[0].lower()] = tokens[1]

    for display_id in display.keys():
        if window_in_display(result, display[display_id]):
            result['display'] = str(display_id)
            break
    else:
        result['display'] = str(0)
        

    return result

def window_move(window_id, x, y):
    stdout, stderr = execute('xdotool windowmove %s %s %s' % (window_id, x, y))

def window_size(window_id, w, h):
    stdout, stderr = execute('xdotool windowsize %s %s %s' % (window_id, w, h))

def get_desktop():
    stdout, stderr = execute('xdotool get_desktop')
    return stdout[0]

def set_desktop(desktop_id):
    stdout, stderr = execute('xdotool set_desktop %s' % desktop_id)

def get_num_desktops():
    stdout, stderr = execute('xdotool get_num_desktops')
    return stdout[0]

def window_active(window_id):
    stdout, stderr = execute('xdotool windowactivate %s' % window_id)

def get_window_active():
    stdout, stderr = execute('xdotool getactivewindow')
    return stdout[0]

def get_cols():
    cols = {}
    windows = get_windows()

    for window_id in windows:
        window = get_window(window_id)
        current = {'id':window_id}

        if not cols.has_key(window['display']):
            cols[window['display']] = []
            current['active'] = True
        else:
            current['active'] = False
        cols[window['display']].append(current)

    return cols

def get_cols_current_index():
    cols = get_cols()
    active = get_window_active()

    window = None
    for col in cols:
        for _window in cols[col]:
            if active == _window['id']:
                window = _window
                cur_col = col

    return cols, cur_col, cols[cur_col].index(window)

def select_up():
    cols, display, index = get_cols_current_index()

    if index == 0:
        index = len(cols[display]) - 1
    else:
        index -= 1
    previous = cols[display][index]

    window_active(previous['id'])

def select_down():
    cols, display, index = get_cols_current_index()

    if index == len(cols[display]) - 1:
        index = 0
    else:
        index += 1
    previous = cols[display][index]

    window_active(previous['id'])

def select_right():
    cols, display, index = get_cols_current_index()

    if int(display) == len(cols) - 1:
        display = '0'
    else:
        display = str(int(display) + 1)

    for _window in cols[display]:
        if _window['active']:
            previous = _window

    window_active(previous['id'])

def select_left():
    cols, display, index = get_cols_current_index()

    if display == '0':
        display = str(len(cols) - 1)
    else:
        display = str(int(display) - 1)

    for _window in cols[display]:
        if _window['active']:
            previous = _window

    window_active(previous['id'])


def select_next():
    num_desktops = int(get_num_desktops())
    current = int(get_desktop())

    if current + 1 == num_desktops:
        current = 0
    else:
        current += 1

    set_desktop(current)

def select_previous():
    num_desktops = int(get_num_desktops())
    current = int(get_desktop())

    if current - 1 < 0:
        current = num_desktops - 1
    else:
        current -= 1

    set_desktop(current)


if len(sys.argv) == 2:
    prog, option = sys.argv

    if option == 'up':
        select_up()
    if option == 'down':
        select_down()
    if option == 'left':
        select_left()
    if option == 'right':
        select_right()
    if option == 'next':
        select_next()
    if option == 'previous':
        select_previous()

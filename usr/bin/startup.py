import os
from subprocess import *

def start(name):
    p1 = Popen(['ps', 'aux'], stdout=PIPE)
    p2 = Popen(['grep', name], stdin=p1.stdout, stdout=PIPE)
    p3 = Popen(['grep', '-v', 'grep'], stdin=p2.stdout, stdout=PIPE)
    output = p3.communicate()[0].splitlines()
    if not output:
        os.system('%s &' % name)

start('gnome-settings-daemon')
start('xbindkeys')
#start('pidgin')
#start('firefox')

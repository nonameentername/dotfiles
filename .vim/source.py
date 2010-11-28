import os
import sys
import vim
sys.path.append(os.path.join(os.path.expanduser('~'), '.vim'))
sys.path.append(os.path.join(os.path.expanduser('~'), 'usr/lib/python'))
sys.path.append(os.path.join(os.path.expanduser('~'), 'usr/lib/python2.6/site-packages'))
from searchfile import searchfile
from searchbuffer import searchbuffer
from searchtags import searchtags
from searchgrep import searchgrep

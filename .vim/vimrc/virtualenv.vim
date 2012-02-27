python << eopython
import os
import sys

if os.environ.has_key('VIRTUAL_ENV'):
    path = '{0}/lib/python{1}.{2}/site-packages'.format(os.environ['VIRTUAL_ENV'], *sys.version_info[:2])
    sys.path.append(path)
eopython

if exists('$VIRTUAL_ENV/ropevim.vim')
    source $VIRTUAL_ENV/ropevim.vim
endif

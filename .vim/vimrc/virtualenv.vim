python << eopython
import os
import sys

if os.environ.has_key('PYENV_ROOT'):
    path = '{0}/versions/default/lib/python{1}.{2}/site-packages'.format(os.environ['PYENV_ROOT'], *sys.version_info[:2])
    sys.path.append(path)
eopython

if len(glob('$PYENV_ROOT/versions/default/share/vim/plugin/ropevim.vim'))
    source $PYENV_ROOT/versions/default/share/vim/plugin/ropevim.vim
endif

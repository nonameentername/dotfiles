if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    source /etc/profile
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
else
    . ~/.bash_aliases
fi

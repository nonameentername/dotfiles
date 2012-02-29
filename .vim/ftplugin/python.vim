let g:ropevim_autoimport_modules = ["sys", "os", "shutil", "django.*", "django", ]
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1

python << eofpython
def rope_omni_complete():
    try:
        from ropemode.interface import _CodeAssist
        import vim

        _code_assist = _CodeAssist(ropevim._interface, ropevim._env)
        proposals = _code_assist._calculate_proposals()
        update = []
        for p in proposals:
            item = ''
            if p.type == 'function':
                menu = '%s def %s (%s)' % (p.type[0], p.name, str(p.parameters).replace("'", "")[:-1][1:])
                item = '{"word":"%s", "menu":"%s"}' % (p.name, menu)
            else:
                item = '{"word":"%s", "menu":"%s"}' % (p.name, p.type[0])

            update.append(item)
        proposals = ', '.join(update)
        vim.command('let g:proposals = [%s]' % proposals)
    except:
        pass
eofpython

fun! RopeOmniComplete(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        let g:proposals = []
        python rope_omni_complete()
        return start
    else
        " find keywords matching with "a:base"
        let res = []
        for proposal in g:proposals
            if proposal['word'] =~ '^' . a:base
        call add(res, proposal)
            endif
        endfor
        return res
    endif
endfun

set omnifunc=pysmell#Complete
set completefunc=RopeOmniComplete
"set completefunc=pysmell#Complete
"set omnifunc=pythoncomplete#Complete

nmap<leader>r :RopeRename<cr>
nmap<leader>i :RopeAutoImport<cr>
nmap<leader>j :RopeGotoDefinition<cr>

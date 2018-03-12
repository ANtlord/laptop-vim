fun! JoinSpaceless()
    let symbols = ['(', '{', '[']
    let res = matchstr(getline('.'), join(symbols, '\|'))
    if index(symbols, res) >= 0
        " When remove it!
        execute 'normal m'
        execute 'normal dw'
    else
        execute 'normal m'
    endif
endfun

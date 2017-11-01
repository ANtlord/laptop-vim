function! s:Foo()
    let b:line = getline('.')
    echo b:line
endfunction

function s:Bar()
    let b:content = '123'
    call append(line('$'), [b:content])
endfunction

function s:Gri()
    vsplit [Name].qwe
    vertical resize 50
    call s:Bar()
endfunction

au BufNewFile,BufRead    *.qwe            set filetype=qwe    " [Feral:176/05@19:09] OGRE3d's material files
au FileType qwe nmap <cr> :Foo<cr>

command! -nargs=0 Foo call s:Foo()
command! -nargs=0 Bar call s:Bar()
command! -nargs=0 Gri call s:Gri()

"""""""
" D settings
"""""""

"""""""
"dutyl_stdImportPaths will be different for Ubuntu. For resolving it, you can
"redefine it in project's .vimrc or you can make symlinks on Ubuntu system

let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd/', '/usr/include/dmd/druntime/', '/usr/include/dmd/phobos/']
let g:dutyl_neverAddClosingParen=1
let g:dutyl_dontUseVimProc = 1
call dutyl#register#tool('dcd-client', $HOME.'/.dub/packages/dcd-0.8.0/dcd/dcd-client')
call dutyl#register#tool('dcd-server', $HOME.'/.dub/packages/dcd-0.8.0/dcd/dcd-server')
call dutyl#register#tool('dfmt', $HOME.'/.dub/packages/dfmt-0.4.5/dfmt/dfmt')
call dutyl#register#tool('dscanner', $HOME.'/.dub/packages/dscanner-0.3.0/dscanner/dscanner')

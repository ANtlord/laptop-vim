"""""""
" D settings
"""""""
map gd :DUjump<CR>
let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd/', '/usr/include/dmd/druntime/import', '/usr/include/dmd/phobos/']
let g:dutyl_neverAddClosingParen=1
let g:dutyl_dontUseVimProc = 1
let g:syntastic_d_dmd_args = '-c -o- -boundscheck=off'
set noexpandtab

call dutyl#register#tool('dcd-client', $HOME.'/.dub/packages/dcd-master/dcd/dcd-client')
call dutyl#register#tool('dcd-server', $HOME.'/.dub/packages/dcd-master/dcd/dcd-server')
"call dutyl#register#tool('dfmt', $HOME.'/.dub/packages/dfmt-0.4.5/dfmt/dfmt')
"call dutyl#register#tool('dscanner', $HOME.'/.dub/packages/dscanner-0.3.0/dscanner/dscanner')

Bundle 'Hackerpilot/DCD'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For coding by D. "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dcd_path='/opt/DCD/'  "path to https://github.com/Hackerpilot/DCD
let g:dcd_importPath=['/usr/include/dlang/dmd'] "path to libs of D.
setlocal omnifunc=dcomplete#Complete

if has('win32')
	command! -buffer -nargs=* -complete=dir DCDstartServer execute '!start '.dcomplete#DCDserver().' '.dcomplete#initImportPath().
				\ ' '.dcomplete#globImportPath([<f-args>])
else
	command! -buffer -nargs=* -complete=dir DCDstartServer execute '!'.dcomplete#DCDserver().' '.dcomplete#initImportPath().
				\ ' '.dcomplete#globImportPath([<f-args>]).' > /dev/null &'
endif
command! -buffer -nargs=? DCD execute '!'.dcomplete#DCDclient().' '.<q-args>
command! -buffer -nargs=? DCDonCurrentBufferPosition echo dcomplete#runDCDOnCurrentBufferPosition(<q-args>)
command! -buffer DCDstopServer DCD --shutdown
command! -buffer -nargs=+ -complete=dir DCDaddPath execute 'DCD '.dcomplete#globImportPath([<f-args>])
command! -buffer DCDclearCache DCD --clearCache

command! -buffer DCDdoc DCDonCurrentBufferPosition --doc
command! -buffer DCDsymbolLocation call dcomplete#runDCDtoJumpToSymbolLocation()

filetype plugin on
set nocp
Bundle 'https://github.com/vim-scripts/OmniCppComplete.git'
Bundle 'octol/vim-cpp-enhanced-highlight'
" configure tags - add additional tags here or comment out not-used ones
"set tags=~/.vim/tags/cpp
"set tags=~/.vim/tags/ogre
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/al
"set tags+=~/.vim/tags/wx
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

function! VoidMethod()
	let a = input('Enter function name: ')
	exe ":norm o" . "void ".a."(){"
	exe ":norm o" . "}"
    call feedkeys('O','n')
    "startinsert
endfunction

function! IntMethod()
	let a = input('Enter function name: ')
	exe ":norm o" . "int ".a."(){"
	exe ":norm o" . "}"
    call feedkeys('O','n')
endfunction

function! CharMethod()
	let a = input('Enter function name: ')
	exe ":norm o" . "char ".a."(){"
	exe ":norm o" . "}"
    call feedkeys('O','n')
endfunction

function! CreateClass()
	let a = input('Enter class name: ')
	exe ":norm o" . "class ".a." {"
	exe ":norm o" . "public:"
	exe ":norm o" . a . "();"
	exe ":norm o~" . a . "();"
	exe ":norm o"
	exe ":norm o"
	exe ":norm o" . "protected:"
	exe ":norm o"
	exe ":norm o"
	exe ":norm o" . "private:"
	exe ":norm o"
	exe ":norm o"
	exe ":norm o" . "};"
endfunction

function! CreateCharEnum()
	let a = input('Enter enum name: ')
	exe ":norm o" . "enum ".a." : char {}"
    call feedkeys('i','n')
endfunction

map <F9> :w<CR>:make -j<CR>
imap <silent> \vf <ESC>:call VoidMethod()<CR>
map <silent> \vf :call VoidMethod()<CR>
imap <silent> \if <ESC>:call IntMethod()<CR>
map <silent> \if :call IntMethod()<CR>
imap <silent> \cf <ESC>:call CharMethod()<CR>
map <silent> \cf :call CharMethod()<CR>
imap <silent> \crc <ESC>:call CreateClass()<CR>
map <silent> \crc :call CreateClass()<CR>
imap <silent> \ce <ESC>:call CreateCharEnum()<CR>
map <silent> \ce :call CreateCharEnum()<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

filetype plugin on
set nocp
"Bundle 'https://github.com/vim-scripts/OmniCppComplete.git'
"Bundle 'octol/vim-cpp-enhanced-highlight'
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
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest


function! DefineClassFile()
    let file_name = expand('%:t')
    let file_name = substitute(file_name, ".*", "\\U\\0", "")
    let file_name = substitute(file_name, "\\.", "_", "")
    exe ":norm ggO" . "#ifndef " . file_name
    exe ":norm o" . "#define " . file_name
    exe ":norm Go" . "#endif //" . file_name
endfunction

if exists("*Mosh_Flip_Ext")
    " do stuff here
else
    function! Mosh_Flip_Ext()
        let file_path = expand('%:r')
        let file_name = expand('%:t')
        if match(expand("%:t"),'\.cpp') > 0
            let file_name = substitute(file_name, ".cpp", ".h", "")
            let bufname = bufname(file_name)

            if (strlen(bufname) > 0)
                exe ":buffer ".bufname
            else
                exe ":open ".(substitute(file_path, "^src", "include", "").".h")
            endif

        elseif match(expand("%:t"),"\.h") > 0
            let file_name = substitute(file_name, ".h", ".cpp", "")
            let bufname = bufname(file_name)

            if (strlen(bufname) > 0)
                exe ":buffer ".bufname
            else
                exe ":open ".(substitute(file_path, "^include", "src", "").".cpp")
            endif
        endif
    endfun
endif

map <F11> <ESC> :call Mosh_Flip_Ext()<CR>
"imap <F11> <ESC> :A<CR>
map <F9> :w<CR>:make -j2<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
autocmd FileType tagbar setlocal ft=qwe

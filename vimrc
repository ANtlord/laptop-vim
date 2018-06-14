set t_Co=8

set nocompatible               " be iMproved
set ruler
set backspace=2
filetype off                   " required!

call plug#begin('~/.vim/plugged')
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'racer-rust/vim-racer'
Plug 'https://github.com/robhudson/snipmate_for_django.git'
Plug 'Lokaltog/vim-easymotion'
" Plug 'Tagbar'
Plug 'leafgarland/typescript-vim'
" Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git', {
    \'do': './install.py --clang-completer --go-completer --rust-completer --js-completer'
\}
"Plug 'https://github.com/davidhalter/jedi-vim.git'
" Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/w0rp/ale.git'
""python plugins"""""""""""""""""""
Plug 'https://github.com/heavenshell/vim-pydocstring.git'
Plug 'https://github.com/hdima/python-syntax.git'
" Plug 'https://github.com/jmcantrell/vim-virtualenv.git'
"Plug 'https://github.com/python-rope/ropevim.git'
""js plugins"""""""""""""""""""""""
Plug 'https://github.com/maksimr/vim-jsbeautify.git'
" Plug 'marijnh/tern_for_vim'
" Plug 'pangloss/vim-javascript'
" Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git'
"""""""""""""""""""""""""""""""""""
Plug 'https://github.com/stephpy/vim-yaml.git'
Plug 'rust-lang/rust.vim'
" Plug 'fatih/vim-go'
Plug 'ekalinin/Dockerfile.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/idanarye/vim-dutyl'
Plug 'https://github.com/terryma/vim-multiple-cursors'
call plug#end()
filetype plugin indent on     " required!*/
syntax on
lang en_US.UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Indention                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set nowrap
set shiftwidth=4
set tabstop=4
set expandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a        " Enable mouse usage (all modes)
set number
let mapleader = ","
set laststatus=2
set ic
set smartcase
set hls
set cursorline
set directory=/tmp
set fencs=utf8,cp1251
set ffs=unix,dos
set nobackup
set noswapfile
set incsearch
colorscheme peachpuff
set exrc
set secure
set splitright
set tm=320
set wildmenu
set nojs

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Optimization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lazyredraw
syntax sync minlines=256
set synmaxcol=140
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldminlines=3
set foldnestmax=4
set nofoldenable
set foldmethod=indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
map <F3> :Buffers<CR>
map <F4> :TagbarToggle<CR>
nmap <F5> :bel copen<CR>
imap <esc><F5> :copen<CR>
" nmap o <Esc>:NERDTreeFind<CR>
nmap o :Vex<CR>
map fr gT
nmap <C-c> "+yy
nmap <C-x> "+dd
vmap <C-c> "+y
vmap <C-x> "+d
nnoremap v <c-v>
imap <C-v> <Esc>"+pa
map <C-v> "+p
imap <C-F12> :q<CR>
map <C-F12> :q<CR>
inoremap <C-l> <C-o>l
map <C-h> :%s///gc<Left><Left><Left><Left>
vmap <C-h> :s///gc<Left><Left><Left><Left>
"imap <C-a> <Esc>:1<CR>vG<end>
nmap <C-a> :1<CR>vG<end>
vmap <tab> >gv
vmap <S-tab> <gv
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

nmap Ж :
" yank
nmap Н Y
nmap з p
nmap ф a
nmap щ o
nmap г u
nmap З P 

nmap . {>}``
nmap , {<}``

nnoremap + <C-W>+
nnoremap _ <C-W>-
nnoremap = <C-W>>
nnoremap - <C-W><
nmap h <C-w>h
nmap l <C-w>l
nmap j <C-w>j
nmap k <C-w>k

vmap Q gq
nmap Q gqap

command Onspell set spelllang=en
au FileType d setlocal comments=sl:/**,mb:\ *,elx:*/
au FileType d setlocal formatoptions+=r

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Source a global configuration file if available
if filereadable("/etc/vimrc.local")
  source /etc/vimrc.local
endif 
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType python setlocal omnifunc=jedi#complete
"autocmd FileType python set ft=python.django " For SnipMate
"autocmd FileType html set ft=htmldjango.html " For SnipMate

"if has("autocmd") && exists("+omnifunc")
	"autocmd Filetype *
			"\	if &omnifunc == "" |
			"\		setlocal omnifunc=syntaxcomplete#Complete |
			"\	endif
    "endif
"Plugin 'git://github.com/vim-scripts/AutoComplPop.git'
"au BufEnter *.py source ~/.vim/plugin/python.vim
"let g:ctags_statusline=1 
"set completeopt-=preview " это для документации
" let NERDTreeShowHidden=1
"let NERDChristmasTree=1
" let NERDTreeMinimalUI=0
" let NERDTreeDirArrows=0
" let NERDTreeHighlightCursorline=0
" let NERDTreeIgnore = ['\.pyc$', '\.o$']
let NERDCommentWholeLinesInVMode = 2
let NERDSpaceDelims = 1
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'cpp': { 'left': '/**','right': '*/' } }

"let g:pydiction_location='/usr/share/pydiction/complete-dict'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JEDI vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'https://github.com/davidhalter/jedi-vim.git'
"let g:jedi#auto_initialization = 1
"let g:jedi#auto_vim_configuration = 1
""let g:jedi#goto_command = "<leader>g"
""let g:jedi#related_names_command = "<leader>n"
""let g:jedi#get_definition_command = "<leader>d"
"let g:jedi#popup_on_dot = 1
"let g:jedi#popup_select_first = 1
"let g:jedi#show_call_signatures = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
" let g:ycm_path_to_python_interpreter='/usr/bin/python2'
" let g:ycm_key_invoke_completion = '<C-Space>'
" let g:ycm_key_invoke_completion = '<C-x><C-o>'
let g:ycm_server_python_interpreter = '/usr/bin/python3' " For YCM
let g:ycm_python_binary_path = '/usr/bin/python2' " For jedi, can be changed in project file.
let g:ycm_filetype_specific_completion_to_disable = {
  \ 'gitcommit': 1,
  \ 'php': 1
\}
let g:ycm_max_num_candidates = 20
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_auto_trigger = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
let g:ycm_always_populate_location_list = 0
let g:ycm_key_list_select_completion = []
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_goto_buffer_command = 'new-tab'

"set path=$PWD/include,$PWD/src
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For scripts of framework OGRE 3D
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead    *.material            setf ogrematerial    " [Feral:176/05@19:09] OGRE3d's material files
au BufNewFile,BufRead    *.program            setf ogrematerial    " [Feral:176/05@19:09] OGRE3d's material files
au BufNewFile,BufRead    *.cg            setf cg    " [Feral:176/05@19:09] OGRE3d's material files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" HTML TEMPLATE HIGHLIGHT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead    *.twig            set filetype=htmldjango
au BufNewFile,BufRead    *.vue            set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color customiazation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi MatchParen ctermbg=blue guibg=lightblue
hi Folded ctermbg=0 ctermfg=236
hi CursorLine term=None cterm=None ctermbg=235
hi Pmenu ctermfg=white ctermbg=238
hi Search ctermfg=black
hi PmenuSel ctermfg=black
hi SpellBad ctermbg=088 ctermfg=white
hi Comment guifg=#777777 ctermfg=240
hi StatusLine ctermbg=yellow ctermfg=blue
hi diffadd ctermbg=236 guifg=#00ff00
hi diffdelete ctermbg=124 guifg=#ff0000
hi diffchange ctermbg=236 guifg=#ff0000
hi DiffText term=reverse cterm=bold ctermbg=12 gui=bold guibg=#ff8060

let g:EasyMotion_leader_key = ',' 
let g:EasyMotion_keys = 'qwerasdfzxc'

function! MyMethod()
    exe "!vpaste ft=".&ft
endfun

nmap <leader>sp :call MyMethod()<CR>

let g:tagbar_type_php = {
    \ 'ctagsbin' : '/opt/ctags/bin/ctags',
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
	\ 'c:classes:0:1',
	\ 'f:functions',
	\ 'g:enums',
	\ 'u:unions',
	\ 's:structs',
	\ 'm:members'
    \ ],
    \'sro': '.',
    \ 'kind2scope' : {
	\ 'c' : 'class',
	\ 'g' : 'enum',
	\ 's' : 'struct',
	\ 'u' : 'union'
    \},
    \ 'scope2kind' : {
	\ 'class'     : 'c',
	\ 'enum'      : 'g',
	\ 'struct'    : 's',
	\ 'union'     : 'u'
    \ }
\}

let g:tagbar_type_d = {
    \ 'ctagstype' : 'd',
    \ 'kinds'     : [
    \ 'c:classes:1:1',
    \ 'f:functions:1:1',
    \ 'T:template:1:1',
    \ 'g:enums:1:1',
    \ 'e:enumerators:0:0',
    \ 'u:unions:1:1',
    \ 's:structs:1:1',
    \ 'v:variables:1:0',
    \ 'i:interfaces:1:1',
    \ 'm:members',
    \ 'a:alias'
    \ ],
    \'sro': '.',
    \ 'kind2scope' : {
    \ 'c' : 'class',
    \ 'g' : 'enum',
    \ 's' : 'struct',
    \ 'u' : 'union',
    \ 'T' : 'template'
    \},
    \ 'scope2kind' : {
    \ 'enum'      : 'g',
    \ 'class'     : 'c',
    \ 'struct'    : 's',
    \ 'union'     : 'u',
    \ 'template'  : 'T'
    \ },
    \ 'ctagsbin' : $HOME.'/.dub/packages/dscanner-master/dscanner/dscanner',
    \ 'ctagsargs' : ['--ctags']
\ }

map <leader>s :execute " grep! -srnw --binary-files=without-match --exclude-dir=.git --exclude-dir=.svn . -e " . expand("<cword>") . " " <bar> cwindow<CR>
map <leader>c :copen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_mode_map = { 'mode': 'active',
         \ 'active_filetypes': ['php', 'python'],
         \ 'passive_filetypes': ['cpp', 'c']}
let g:syntastic_php_checkers = ['phplint', 'php']
"let g:syntastic_python_checkers = ['flake8', 'python', 'pyflakes', 'pylint']
" let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_args=''
let g:syntastic_php_phplint_quiet_messages = {
    \ "!level":  "errors",
    \ "!regex":   ['.*variable.*'],
\}
let g:syntastic_loc_list_height = 5
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=0
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_echo_current_error = 0

""""""""""""""""
" GO settings
""""""""""""""""
" setlocal omnifunc=go#complete#Complete
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
au FileType go set noexpandtab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '10' }

set hidden
""""""
" RUST
""""""
let g:racer_cmd = $HOME.'/.cargo/bin/racer'
let $RUST_SRC_PATH = $HOME.'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
au FileType netrw nmap <buffer> <silent> <nowait> q :q!<CR>
""""""

""""""""""""""
" ALE LINTER
""""""""""""""
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_set_highlights = 1
let g:ale_list_window_size = 5

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
    \'python': ['flake8'],
    \'rust': [],
\}
"""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO PAIRS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '\'
let g:AutoPairsShortcutFastWrap = 'r'
let g:AutoPairsShortcutJump = 'n'
let g:AutoPairsCenterLine = 0

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 0
let g:netrw_winsize = 20
let g:netrw_mousemaps = 0
" let g:netrw_usetab = 1

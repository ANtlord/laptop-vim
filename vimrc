set t_Co=8

set nocompatible               " be iMproved

set ruler
set backspace=2
filetype off                   " required!

call plug#begin('~/.vim/plugged')
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Lokaltog/vim-easymotion'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
" Plug 'https://github.com/Valloric/YouCompleteMe.git', {
    " \'do': './install.py --clang-completer --go-completer --rust-completer --js-completer'
" \}
Plug 'https://github.com/vim-scripts/highlight.vim'

""""""""""""""""""""""""""""""""
""" LANGUAGE SERVER """"""""""""
""""""""""""""""""""""""""""""""
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', {'do': 'pip3 install --user neovim'}
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
 " Plug 'landaire/deoplete-d'
""

" Plug 'https://github.com/davidhalter/jedi-vim.git'
" Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/w0rp/ale.git'
""python plugins"""""""""""""""""""
" Plug 'https://github.com/heavenshell/vim-pydocstring.git'
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
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'https://github.com/idanarye/vim-dutyl'
" Plug 'https://github.com/terryma/vim-multiple-cursors'
call plug#end()
filetype plugin indent on     " required!*/
syntax on
lang en_US.UTF-8

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
let g:LanguageClient_serverCommands = {
    \ 'd': [$HOME.'/.dub/packages/.bin/dls-latest/dls']
    \ }

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
set hls
set cursorline
set directory=/tmp
set fencs=utf8,cp1251
set ffs=unix,dos
set nobackup
set noswapfile
"""search options""""
set incsearch
set nowrapscan
set smartcase
""""""""""""""""""""""""""""""
" Word highlighting
""""""""""""""""""""""""""""""
nnoremap 3 :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap 4 :let @/='<C-R>=expand("<cword>")<CR>'<CR>:set hls<CR>
" colorscheme peachpuff
colorscheme breeze
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
nmap o :Vex<CR>
map fr gT
"""Selection and copying"""
nmap <C-c> "+yy
nmap <C-x> "+dd
vmap <C-c> "+y
vmap <C-x> "+d
nnoremap v <c-v>
imap <C-v> <Esc>"+pa
map <C-v> "+p
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
" nmap h <C-w>h
" nmap l <C-w>l
" nmap j <C-w>j
" nmap k <C-w>k

vmap Q gq
nmap Q gqap

command! -bang -nargs=* Agw call fzf#vim#ag(<q-args>, '--word-regexp', <bang>0)
nmap  gr :Agw <C-r><C-w><CR>
nmap  gR :Ag <C-r><C-w><CR>
nmap f :Buffers<CR>
nnoremap ' ;
nnoremap ; ,
vnoremap ' ;
vnoremap ; ,
nmap 1 :set rnu!<CR>


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
"if has("autocmd") && exists("+omnifunc")
	"autocmd Filetype *
			"\	if &omnifunc == "" |
			"\		setlocal omnifunc=syntaxcomplete#Complete |
			"\	endif
    "endif
"au BufEnter *.py source ~/.vim/plugin/python.vim
"let g:ctags_statusline=1 
"set completeopt-=preview " это для документации
let NERDCommentWholeLinesInVMode = 2
let NERDSpaceDelims = 1
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'cpp': { 'left': '/**','right': '*/' } }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JEDI vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#completions_enabled = 0
" let g:jedi#goto_command = "<leader>g"
""let g:jedi#related_names_command = "<leader>n"
" let g:jedi#get_definitions_command = "<leader>d"
"let g:jedi#popup_on_dot = 1
"let g:jedi#popup_select_first = 1
"let g:jedi#show_call_signatures = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_server_python_interpreter = '/usr/bin/python3' " For YCM
let g:ycm_python_binary_path = '/usr/bin/python2' " For jedi, can be changed in project file.
let g:ycm_filetype_specific_completion_to_disable = {
  \ 'gitcommit': 1,
  \ 'php': 1,
  \ 'd': 1
\}
let g:ycm_max_num_candidates = 20
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_auto_trigger = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_always_populate_location_list = 0
let g:ycm_key_list_select_completion = []
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_goto_buffer_command = 'new-tab'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" HTML TEMPLATE HIGHLIGHT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead    *.twig            set filetype=htmldjango
au BufNewFile,BufRead    *.vue            set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color customiazation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hi MatchParen ctermbg=blue guibg=lightblue
" hi Folded ctermbg=0 ctermfg=236
" hi CursorLine term=None cterm=None ctermbg=235
" hi Pmenu ctermfg=white ctermbg=238
" hi Search ctermfg=black
" hi PmenuSel ctermfg=black
" hi SpellBad ctermbg=088 ctermfg=white
" hi Comment guifg=#777777 ctermfg=240
" hi StatusLine ctermbg=yellow ctermfg=blue
" hi diffadd ctermbg=236 guifg=#00ff00
" hi diffdelete ctermbg=124 guifg=#ff0000
" hi diffchange ctermbg=236 guifg=#ff0000
" hi DiffText term=reverse cterm=bold ctermbg=12 gui=bold guibg=#ff8060
set textwidth=100

let g:EasyMotion_leader_key = ',' 
let g:EasyMotion_keys = 'qwerasdfzxc'

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
let g:fzf_files_options = ['+m']

set hidden
""""""
" RUST
""""""
let g:racer_cmd = $HOME.'/.cargo/bin/racer'
let $RUST_SRC_PATH = $HOME.'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
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
let g:AutoPairsShortcutJump = '<C-g>'
let g:AutoPairsCenterLine = 0

"""""""""""""""""""""""""""
" NETRW
"""""""""""""""""""""""""""
au FileType netrw nmap <buffer> <silent> <nowait> q :q!<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 0
let g:netrw_winsize = 20
let g:netrw_mousemaps = 0
" let g:netrw_usetab = 1

let g:deoplete#enable_at_startup = 1

nmap <leader>o yawO//pa<Space>
nmap <leader>qq I'Ei'

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
let @q='^f_lveyEa: "pvBluEa"lDa,'

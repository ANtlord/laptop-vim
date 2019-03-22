call plug#begin('~/.vim/plugged')
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Lokaltog/vim-easymotion'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git', {
    \'do': './install.py --clang-completer --go-completer --rust-completer --js-completer'
\}
Plug 'https://github.com/vim-scripts/highlight.vim'

""" Additional colorschemes
Plug 'https://github.com/cocopon/iceberg.vim/'
Plug 'https://github.com/freeo/vim-kalisi'

Plug 'https://github.com/w0rp/ale.git'
""python plugins"""""""""""""""""""
Plug 'https://github.com/hdima/python-syntax.git'
""js plugins"""""""""""""""""""""""
Plug 'https://github.com/maksimr/vim-jsbeautify.git'
"""""""""""""""""""""""""""""""""""
Plug 'https://github.com/stephpy/vim-yaml.git'
Plug 'rust-lang/rust.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()
source $HOME/.vim/basic_settings.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

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

let g:EasyMotion_leader_key = ',' 
let g:EasyMotion_keys = 'qwerasdfzxc'

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
command! -bang -nargs=* Agw call fzf#vim#ag(<q-args>, '--word-regexp', <bang>0)
nmap  gr :Agw <C-r><C-w><CR>
nmap  gR :Ag <C-r><C-w><CR>
nmap f :Buffers<CR>
nmap <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '10' }
let g:fzf_files_options = ['+m']

set hidden
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:racer_cmd = $HOME.'/.cargo/bin/racer'
let $RUST_SRC_PATH = $HOME.'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE LINTER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO PAIRS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '\'
let g:AutoPairsShortcutFastWrap = 'r'
let g:AutoPairsShortcutJump = '<C-g>'
let g:AutoPairsCenterLine = 0

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
let @q='^f_lveyEa: "pvBluEa"lDa,'

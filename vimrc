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
Plug 'https://github.com/hdima/python-syntax.git'
""" Additional colorschemes
Plug 'https://github.com/cocopon/iceberg.vim/'
Plug 'https://github.com/freeo/vim-kalisi'

Plug 'https://github.com/w0rp/ale.git'
""js plugins"""""""""""""""""""""""
Plug 'https://github.com/maksimr/vim-jsbeautify.git'
"""""""""""""""""""""""""""""""""""
Plug 'https://github.com/stephpy/vim-yaml.git'
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

let g:EasyMotion_leader_key = ',' 
let g:EasyMotion_keys = 'qwerasdfzxc'

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

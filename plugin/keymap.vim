"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key Bindings related to basic functions or embedded plugins (like Netrw).
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap 1 :set rnu!<CR>
nnoremap 3 :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap 4 :let @/='<C-R>=expand("<cword>")<CR>'<CR>:set hls<CR>
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
nmap <F5> :bel copen<CR>
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
map <C-h> :%s///gc<Left><Left><Left><Left>
vmap <C-h> :s///gc<Left><Left><Left><Left>
nmap <C-a> :1<CR>vG<end>
vmap <tab> >gv
vmap <S-tab> <gv

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

vmap Q gq
nmap Q gqap

nnoremap ' ;
nnoremap ; ,
vnoremap ' ;
vnoremap ; ,
nmap q q:
nmap <leader>o yawO//pa<Space>
nmap <leader>qq I'Ei'

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

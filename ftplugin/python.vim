"let g:pymode_lint = 0
"let g:pymode_rope = 0

"g:pymode_lint_cheker = "pylint"
"filetype on
"filetype plugin on
hi Folded guifg=#cccccc guibg=#222222 
hi Constant guifg=#44ff44
let NERDTreeIgnore = ['\.pyc$']
"hi Folded guifg=#cccccc guibg=#111111 gui=bold 
"hi Folded guifg=#84b9ae guibg=#444444
"let fdm='fold-syntax'
"let g:pymode = 1
"let g:pymode_syntax = 0
"let g:pymode_rope_goto_def_newwin = 0
"let g:pymode_rope_always_show_complete_menu = 0
"let g:pymode_virtualenv = 1
"let g:pymode_lint_cwindow = 0
"let g:pymode_indent = 0
"imap <C-c> <Esc>"+ya
"map <C-c> "+y
"imap <C-x> <Esc>"+da
"map <C-x> "+d
"imap <C-v> <Esc>"+pa
"map <C-v> "+p
"if getline(1) =~ 'from django.db import models'
    "Snippet addmodel class <{}>(models.Model):<CR><><CR><CR>def __unicode__(self):<CR>return "%s" % (<{}>,)
    "Snippet mcf models.CharField(max_length=<{}>)<CR><{}>
    "Snippet mff models.FileField(upload_to=<{}>)<CR><{}>
    "Snippet mfpf models.FilePathField(path=<{}>, match="<{}>", recursive=<False>)<CR><{}>
    "Snippet mfloat models.FloatField(max_digits=<{}>, decimal_places=<{}>)<CR><{}>
    "Snippet mfk models.ForeignKey(<{}>)<CR><{}>
    "Snippet m2m models.ManyToManyField(<{}>)<CR><{}>
    "Snippet o2o models.OneToOneField(<{}>)<CR><{}>

function! SetFunc()
    let a = input('Enter function name: ')
    exe ":norm o" . "def ".a."():"
    exe ":norm o"
    call feedkeys('O','n')
endfunction

function! AddModel()
    let a = input('Enter model name: ')
    exe ":norm o" . "class ".a."(models.Model):"
    exe ":norm o" . "class Meta:"
    exe ":norm o" . "verbose_name=u''"
    exe ":norm o" . "verbose_name_plural=u''"
endfunction

"function! ForeignKey()
    "let a = input('Enter field name: ')
    "exe "norm i".a." = models.ForeignKey(max_length=255, blank=True, null=True, verbose_name=u'')"
    "exe ":norm o"
"endfunction

"function! IntegerField()
    "let a = input('Enter field name: ')
    "exe "norm ".a." = models.IntegerField(max_length=255, blank=True, null=True, verbose_name=u'')"
    "exe ":norm o"
"endfunction

"function! BooleanField()
    "let a = input('Enter field name: ')
    "exe "norm i".a." = models.BooleanField(default=False, verbose_name=u'')"
    "exe ":norm o"
"endfunction

"function! ImageField()
    "let a = input('Enter field name: ')
    "exe "norm i".a." = models.ImageField(upload_to=generate_upload_name, verbose_name=u'Файл')"
    "exe ":norm o"
"endfunction

imap <silent> \cf = models.CharField(max_length=255, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>
map <silent> \cf o= models.CharField(max_length=255, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>

imap <silent> \fk = models.ForeignKey('to model', related_name='name for access', verbose_name=u'')<ESC>I<space><left>
map <silent> \fk o= models.ForeignKey('to model', related_name='name for access', verbose_name=u'')<ESC>I<space><left>

imap <silent> \if = models.IntegerField(default=0, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>
map <silent> \if o= models.IntegerField(default=0, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>

imap <silent> \bf = models.BooleanField(default=False, verbose_name=u'')<ESC>I<space><left>
map <silent> \bf o= models.BooleanField(default=False, verbose_name=u'')<ESC>I<space><left>

imap <silent> \im = models.ImageField(upload_to=generate_upload_name, verbose_name=u'Изображение', blank=True, null=True)<ESC>I<space><left>
map <silent> \im o= models.ImageField(upload_to=generate_upload_name, verbose_name=u'Изображение', blank=True, null=True)<ESC>I<space><left>

imap <silent> \setfunc <ESC>:call SetFunc()<CR>
map <silent> \setfunc :call SetFunc()<CR>

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

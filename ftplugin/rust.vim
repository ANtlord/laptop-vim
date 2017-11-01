" --regex-Rust=/^[ \t]*(#\[[^\]]\][ \t]*)*(pub[ \t]+)?(extern[ \t]+)?("[^"]+"[ \t]+)?(unsafe[ \t]+)?fn[ \t]+([a-zA-Z0-9_]+)/\6/q,functions,function definitions/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?type[ \t]+([a-zA-Z0-9_]+)/\2/w,types,type definitions/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?enum[ \t]+([a-zA-Z0-9_]+)/\2/e,enum,enumeration names/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?struct[ \t]+([a-zA-Z0-9_]+)/\2/r,structure names/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?mod[ \t]+([a-zA-Z0-9_]+)/\2/y,modules,module names/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?(static|const)[ \t]+(mut[ \t]+)?([a-zA-Z0-9_]+)/\4/u,consts,static constants/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?(unsafe[ \t]+)?trait[ \t]+([a-zA-Z0-9_]+)/\3/o,traits,traits/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?(unsafe[ \t]+)?impl([ \t\n]*<[^>]*>)?[ \t]+(([a-zA-Z0-9_:]+)[ \t]*(<[^>]*>)?[ \t]+(for)[ \t]+)?([a-zA-Z0-9_]+)/\5 \7 \8/p,impls,trait implementations/
" --regex-Rust=/^[ \t]*macro_rules![ \t]+([a-zA-Z0-9_]+)/\1/d,macros,macro definitions/

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

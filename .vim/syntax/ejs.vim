runtime! syntax/html.vim
unlet b:current_syntax

" Include Java syntax
syn include @ejsJavaScript syntax/javascript.vim

syn region ejsScriptlet matchgroup=ejsTag start=/<%/  keepend end=/%>/ contains=@ejsJavaScript
syn region ejsExpr	matchgroup=ejsTag start=/<%=/ keepend end=/%>/ contains=@ejsJavaScript

" Redefine htmlTag so that it can contain jspExpr
syn clear htmlTag
syn region htmlTag start=+<[^/%]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,ejsExpr,javaScript


" syn keyword ejsPrint contained print
syn match javaScriptType        /\<\zsvars\ze\./
syn match javaScriptSpecial     /\<\zsexports\ze\./
syn match javaScriptFunction    /\<\zsprint\ze(/
syn match javaScriptFunction    /\<\zsinclude\ze(/
syn match javaScriptFunction    /\<\zsincludeObject\ze(/
syn match javaScriptFunction    /\<\zsfetch\ze(/
syn match javaScriptFunction    /\<\zsfetchObject\ze(/

command -nargs=+ HiLink hi def link <args>
HiLink  ejsTag      htmlTag
delcommand HiLink

let b:current_syntax = "ejs"


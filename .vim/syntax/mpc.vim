function! TextEnableCodeSnip( start, filetype ) abort

  let ft=toupper(a:filetype)
  let group='textGroup'.ft

  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif

  try
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry

  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif

  execute 'syntax region textSnip'.ft.'
  \ matchgroup=PreProc
  \ start=/^--- '.a:start.' ---\+$/ 
  \ end=/^--- [^ ]\+ ---\+$/me=s-1
  \ contains=@'.group

endfunction

call TextEnableCodeSnip( 'Template',    'ejs' )
call TextEnableCodeSnip( 'ejs',         'ejs')
call TextEnableCodeSnip( 'jst',         'ejs')
call TextEnableCodeSnip( 'html',        'html' )
call TextEnableCodeSnip( 'js',          'javascript' )
call TextEnableCodeSnip( 'less',        'less' )

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
call TextEnableCodeSnip( 'requirements','yaml' )
call TextEnableCodeSnip( 'exports',     'yaml' )

call TextEnableCodeSnip( 'css',         'css' )
call TextEnableCodeSnip( 'ejs',         'ejs')
call TextEnableCodeSnip( 'html',        'html' )
call TextEnableCodeSnip( 'jade',        'jade' )
call TextEnableCodeSnip( 'jade-react',  'jade' )
call TextEnableCodeSnip( 'js',          'javascript' )
call TextEnableCodeSnip( 'jst',         'ejs')
call TextEnableCodeSnip( 'less',        'less' )
call TextEnableCodeSnip( 'livescript',  'ls' )
call TextEnableCodeSnip( 'ls',          'ls' )
call TextEnableCodeSnip( 'markdown',    'markdown' )
call TextEnableCodeSnip( 'md',          'markdown' )
call TextEnableCodeSnip( 'react-jade',  'jade' )
call TextEnableCodeSnip( 'react-spec',  'javascript' )
call TextEnableCodeSnip( 'react-spec-ls',   'ls' )
call TextEnableCodeSnip( 'styl',        'stylus' )
call TextEnableCodeSnip( 'stylus',      'stylus' )
call TextEnableCodeSnip( 'yaml',        'yaml' )
call TextEnableCodeSnip( 'yml',         'yaml' )


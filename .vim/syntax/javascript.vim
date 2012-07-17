""" CommonJS require():
syn match javaScriptStatement   /\W\zsrequire\ze(/

""" good-job functions:   
syn match javaScriptStatement   /\W\zsX\ze\./

syn match javaScriptType        /\.\zsget\ze(/
syn match javaScriptType        /\.\zsgetAll\ze(/
syn match javaScriptType        /\.\zswait\ze(/

syn match javaScriptFunction    /\.\zscall\ze(/
syn match javaScriptFunction    /\.\zscallSync\ze(/
syn match javaScriptFunction    /\.\zsonError\ze(/
syn match javaScriptFunction    /\.\zsexitOnError\ze(/
syn match javaScriptFunction    /\.\zsjob\ze(/
syn match javaScriptFunction    /\.\zscreateFunction\ze(/
syn match javaScriptFunction    /\.\zsapply\ze(/
syn match javaScriptFunction    /\.\zsoptions\ze(/

syn match javaScriptSpecial     /^\s\+\zs\w\+\ze:/



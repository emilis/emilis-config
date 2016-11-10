" Vim color file
" Maintainer:	Emilis Dambauskas <emilis.d@gmail.com>

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
set background=light

" Remove all existing highlighting and set the defaults.
hi clear Normal
set bg&
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "emilis-light"

""" Constants -----------------------------------------------------------------

let s:background =  'none' "15 "233
let s:foreground =  0 "249
let s:pink =        203
let s:orange =      166
let s:green_lo =    2
let s:cyan_lo =     24 "6
let s:brown =       94 "95

let s:black =       0
let s:red =         1
let s:green =       28
let s:yellow =      3
let s:blue =        20 "4
let s:magenta =     53 "5
let s:cyan =        6
let s:gray_hi =     248 "7
let s:gray =        8
let s:red_hi =      9
let s:green_hi =    10
let s:yellow_hi =   11
let s:blue_hi =     26 "12
let s:magenta_hi =  13
let s:cyan_hi =     14
let s:white =       15

""" Functions -----------------------------------------------------------------

fun s:hi(...)

    let l:argcount =    a:0
    let l:group =       a:1
    let l:fg =          a:2

    if l:argcount == 2
        exec "hi " . l:group . " ctermfg=" . l:fg
    elseif l:argcount == 3
        let l:bg =      a:3
        exec "hi " . l:group . " ctermfg=" . l:fg . " ctermbg=" . l:bg
    elseif l:argcount == 4
        let l:bg =      a:3
        let l:attr =    a:4
        exec "hi " . l:group . " ctermfg=" . l:fg . " ctermbg=" . l:bg . " cterm=" . l:attr
    endif
endfun

fun s:higroupsfg(fg, groups)

    for group in a:groups
        call s:hi(group, a:fg)
    endfor
endfun

""" Highliting ----------------------------------------------------------------

call s:hi( "Normal",        s:foreground, s:background )
call s:hi( "Error",         s:white, s:red )
call s:hi( "Todo",          s:black, s:yellow )
call s:hi( "Special",       s:green_lo )
call s:hi( "jsFuncCall",    s:brown )

call s:higroupsfg( s:gray_hi, [
    \ "Comment",
    \ "Noise",
    \ ])

call s:higroupsfg( s:green, [
    \ "jsFunction",
    \ "jsFunctionKey",
    \ "jsArrowFunction",
    \ "jsReturn",
    \ "jsKeyword",
    \ "jsModules",
    \ "jsModuleWords",
    \ "jsCommonJsModules",
    \ "jsAsyncKeyword",
    \ "jsSpread",
    \ ])

call s:higroupsfg( s:red, [
    \ "jsClass",
    \ "jsThis",
    \ "jsPrototype",
    \ "jsStatic",
    \ "jsSuper",
    \ "jsDecorator",
    \ "jsFutureKeys",
    \ "jsConstructor",
    \ ])
" add jsOperator ???

call s:higroupsfg( s:magenta, [
    \ "Boolean",
    \ "Character",
    \ "Constant",
    \ "Float",
    \ "Number",
    \ "String",
    \ "jsUndefined",
    \ "jsNull",
    \ "jsNan",
    \ ])

call s:higroupsfg( s:blue_hi, [
    \ "StorageClass",
    \ "jsArgsObj",
    \ ])
call s:higroupsfg( s:cyan_lo, [
    \ "jsObjectKey",
    \ "jsFunctionKey",
    \ "jsAssignmentExpr",
    \ "Function",
    \ ])

call s:higroupsfg( s:orange, [
    \ "jsException",
    \ "jsExceptions",
    \ ])

call s:higroupsfg( s:blue, [
    \ "Statement",
    \ "Repeat",
    \ "Operator",
    \ ])

"   hi Noise ctermfg=8
"   hi Comment ctermfg=8
"   hi Special ctermfg=13
"   hi jsObjectKey ctermfg=12
"   hi String ctermfg=203
"   hi Function ctermfg=14

"   Boolean         red
"   Character       red
"   Comment         blue
"   Conditional     brown
"   Constant        red
"   Error           inverted red
"   Exception       brown
"   Float           red
"   Function        cyan
"   Include         magenta
"   jsFunction      green
"   jsObjectKey     light-blue
"   Keyword         brown
"   Label           brown
"   Noise           dark-grey
"   Number          red
"   Operator        brown
"   PreProc         magenta
"   Repeat          brown
"   Special         magenta
"   SpecialChar     magenta
"   Statement       brown
"   StorageClass    green
"   String          red
"   Structure       green
"   Todo            
"   Type            green

""" Tear-down -----------------------------------------------------------------

delf s:hi
delf s:higroupsfg

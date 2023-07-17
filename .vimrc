" Tabs:
set tabstop=4
set shiftwidth=4
set expandtab 
set softtabstop=4

" Indenting:
set autoindent
filetype plugin indent on
set pastetoggle=<F12>

" Colors:
set t_Co=256
colorscheme default
au ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
au ColorScheme default highlight Comment ctermfg=DarkGray
au ColorScheme default highlight jsIdentifier ctermfg=DarkBlue

" Left padding:
set foldcolumn=2
au ColorScheme * highlight FoldColumn ctermbg=NONE guibg=NONE
sign define dummy 
function! ShowSignColumn()
    execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
endfunction
au BufEnter * nested call ShowSignColumn()

" Convenient options:
syntax on
set wildmenu
set mouse=a

au VimLeavePre * if v:this_session != '' | exec 'mks! ' . v:this_session | endif

" Custom filetypes:
filetype on
au BufNewFile,BufRead *.jsx     set filetype=javascript
autocmd FileType yaml,yml setlocal ts=4 sts=4 sw=4 expandtab

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'js': ['eslint'],
\   'jsx': ['eslint'],
\}
let g:ale_linters_ignore = {
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\}

let g:polyglot_disabled = ['autoindent', 'js']
" let g:polyglot_disabled = ['js', 'jsx']

" coc.nvim config --------------------------------------------------------------

let g:coc_disable_startup_warning = 1

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <c-@> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" END OF coc.nvim config -------------------------------------------------------

" Key maps:
map     <A-Right>   :sh<CR>
map     <A-Left>    :qall<CR>

com! Kwbd enew|bw # 
com! WM w|make -j 4 -i
" command -nargs=+ WMB w|!make <q-args> % > /dev/null &

""" ALE Fixers:
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\ 'sass': ['sasslint'],
\}

" Commands:

com! CheckHighlightUnderCursor echo {l,c,n ->
    \   'hi<'    . synIDattr(synID(l, c, 1), n)             . '> '
    \  .'trans<' . synIDattr(synID(l, c, 0), n)             . '> '
    \  .'lo<'    . synIDattr(synIDtrans(synID(l, c, 1)), n) . '> '
    \ }(line("."), col("."), "name")


" Functions:

" fill rest of line with characters
function! Line80()
    let tw =    80
    let str =   '-'
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(str, reps))/
    endif
    call feedkeys( 'o', 'n' )
endfunction
command Line80 call Line80()
command LLine80 call Line80()

" Backups go to:
set   backupdir=./.backup,.,/tmp
set   directory=.,./.backup,/tmp

" Explorer / Netrw options:
let g:netrw_liststyle=3

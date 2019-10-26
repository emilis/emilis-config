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

" Custom filetypes:
filetype on
au BufNewFile,BufRead *.cshtml  set filetype=html
au BufNewFile,BufRead *.ejs     set filetype=ejs
au BufNewFile,BufRead *.jst     set filetype=ejs
au BufNewFile,BufRead *.ino     set filetype=c
au BufNewFile,BufRead *.jsm     set filetype=javascript
au BufNewFile,BufRead *.json    set filetype=javascript
au BufNewFile,BufRead *.less    set filetype=less
au BufNewFile,BufRead *.mjs     set filetype=javascript
au BufNewFile,BufRead *.webapp  set filetype=javascript
au BufNewFile,BufRead *.mpc     set filetype=mpc

" Key maps:
map     <F6>    :bp!<CR>
imap    <F6>    <esc>:bp!<CR> 
map     <F7>    :bn!<CR>
imap    <F7>    <esc>:bn!<CR>

map     <C-Up>      :bp!<CR>
imap    <C-Up>      <esc>:bp!<CR>
map     <C-Down>    :bn!<CR>
imap    <C-Down>    :bn!<CR>

map     <A-Right>   :sh<CR>
map     <A-Left>    :qall<CR>
map     <A-Up>      :GitGutterPrevHunk<CR>
imap    <A-Up>      <esc>:GitGutterPrevHunk<CR>
map     <A-Down>    :GitGutterNextHunk<CR>
imap    <A-Down>    <esc>:GitGutterNextHunk<CR>

com! Kwbd enew|bw # 
com! WM w|make -j 4 -i
command -nargs=+ WMB w|!make <q-args> % > /dev/null &
com! WJ w|jake
" write, commit with message
command -nargs=+ Wcm w|!git commit -m <q-args> %

""" ALE Fixers:
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\ 'sass': ['sasslint'],
\}

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

" Abbreviations:
iab <expr> date» strftime("%FT%T%z")
iab <expr> time» strftime("%T")
iab <expr> now» strftime("%FT%T%z")

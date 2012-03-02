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
colorscheme morning
set foldcolumn=4
au ColorScheme * highlight FoldColumn ctermbg=bg guibg=bg
au ColorScheme * highlight StatusLineNC ctermfg=bg guifg=bg

" Top padding:
function! TopPadding()
    silent! leftabove 1 split __TopPadding__
    silent! setlocal buftype=nofile
    silent! setlocal nobuflisted
    silent! setlocal noswapfile
    setlocal noma
    setlocal nocursorline
    setlocal nonumber
    silent! setlocal norelativenumber
    wincmd j
    au BufEnter __TopPadding__ nested call TopPaddingClose()
endfunction
function! TopPaddingClose()
    if winnr() == winbufnr(bufnr("__TopPadding__"))
        bdelete
    endif
endfunction
command TopPadding call TopPadding()
au VimEnter * nested call TopPadding()

" Convenient options:
syntax on
set wildmenu
set mouse=a

" Custom filetypes:
filetype on
au BufNewFile,BufRead *.ejs set filetype=javascript
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.cshtml set filetype=html

" Key maps:
map <F6> :bp!<CR>
imap <F6> <esc>:bp!<CR> 
map <F7> :bn!<CR>
imap <F7> <esc>:bn!<CR>

map <C-PageUp> :bp!<CR>
imap <C-PageUp> <esc>:bp!<CR>
map <C-PageDown> :bn!<CR>
imap <C-PageDown> :bn!<CR>

map <A-Right> :sh<CR>
map <A-Left> :q<CR>

com! Kwbd enew|bw # 
com! WM w|make
command -nargs=+ WMB w|!make <q-args> % > /dev/null &
com! WJ w|jake
" write, commit with message
command -nargs=+ Wcm w|!git commit -m <q-args> %

" Backups go to:
set   backupdir=./.backup,.,/tmp
set   directory=.,./.backup,/tmp

" TagList plugin options:
let tlist_php_settings = 'php;c:class;d:constant;f:function'
let Tlist_Auto_Open = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 1
let Tlist_Highlight_Tag_On_BufEnter = 0
let Tlist_Auto_Highlight_Tag = 0


" Abbreviations:
iab <expr> date» strftime("%FT%T%z")
iab <expr> time» strftime("%T")
iab <expr> now» strftime("%FT%T%z")


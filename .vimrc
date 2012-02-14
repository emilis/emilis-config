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

com! Kwbd enew|bw # 
com! WM w|make
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


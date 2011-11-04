set nocp
syntax on

set tabstop=4
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType php setlocal sts=4 ts=4 sw=4
autocmd FileType php cnoreabbrev <buffer> w w<bar>!php -l % \|\| sleep 2<CR>

source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" Tab mappings
map Oc :tabnext<CR>
map Od :tabprevious<CR>

map ^[O5C :tabnext<CR>
map ^[O5D :tabprevious<CR>

" To work on OSX terminal
map [5D :tabprevious<CR>
map [5C :tabnext<CR>

map [1;5C :tabnext<CR>
map [1;5D :tabprevious<CR>
"map ^[[C :tabnext<CR>
"map ^[[D :tabprevious<CR>

map ^[[1;5C :tabnext<CR>
map ^[[1;5D :tabprevious<CR>
map ^[[D :tabprevious<CR>
map ^[[C :tabnext<CR>

source ~/.vim/NERD_tree.vim
source ~/.vim/taglist.vim
source ~/.vim/mru.vim
source ~/.vim/tabmerge.vim
source ~/.vim/plugin/supertab.vim
source ~/.vim/plugin/ctags.vim

let g:ctags_statusline=1 
let g:ctags_title=1 
let generate_tags=1

set popt=portrait:n
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.phtml set filetype=php

let PHP_autoformatcomment = 0
let g:netrw_keepdir=0
let g:netrw_browse_split=2
filetype plugin indent on
set smartindent
set backspace=indent,eol,start
set foldmethod=marker
set ruler
set history=200

" Stop no-indent on python comment lines!
inoremap # X#

let Tlist_Ctags_Cmd = '/usr/local/bin/exctags'
let g:ctags_path='/usr/local/bin/exctags'

filetype indent on
filetype on
let Tlist_WinWidth = 45

cnoreabbrev vimshell ConqueTerm bash
highlight SpellBad term=reverse ctermbg=7
set tabpagemax=500


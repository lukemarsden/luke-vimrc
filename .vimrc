set nocp
syntax on

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType php cnoreabbrev <buffer> w w<bar>!php -l % \|\| sleep 2<CR>

source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" map ctrl+w to ctrl+e so that disabled ctrl+w (jupyter terminal vs chrome)
" isn't totally infuriating
nnoremap <C-e> <C-w>

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
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.ts set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.rst set wrap
au BufNewFile,BufRead *.rst set linebreak
au BufNewFile,BufRead *.rst set nolist
au BufNewFile,BufRead *.rst set textwidth=0
au BufNewFile,BufRead *.rst set wrapmargin=0

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead *.md set filetype=markdown

au BufNewFile,BufRead *Todo.txt set filetype=todo

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

let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:ctags_path='/usr/bin/ctags'

filetype indent on
filetype on
let Tlist_WinWidth = 45

cnoreabbrev vimshell ConqueTerm bash
highlight SpellBad term=reverse ctermbg=7
set tabpagemax=500
cnoremap <C-k> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

execute pathogen#infect()

" Home/End for Mac
imap <C-a> <Home>
imap <C-e> <End>

syntax enable
filetype plugin on
" set number
let g:go_disable_autoinstall = 0
" colorscheme molokai
" autocmd BufWritePre *.go :GoBuild

" Build/Test on save.
augroup auto_go
	autocmd!
	autocmd BufWritePost *.go :GoBuild
augroup end

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)


if !1 | finish | endif

if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'stephpy/vim-yaml'
" NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'jistr/vim-nerdtree-tabs'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'itchyny/lightline.vim'
call neobundle#end()

filetype plugin indent on
NeoBundleCheck

nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
nnoremap <silent><C-n> :tabnext<CR>
nnoremap <silent><C-p> :tabprevious<CR>
set backspace=2

syntax enable
set background=light
" colorscheme solarized

set number
set encoding=utf-8
set fileencoding=utf-8
" set fileencodings=utf-8,sjis,cp932,euc-jp
set cursorline
set ignorecase
set smartcase
set hlsearch
vnoremap <silent> // y/<C-R>=escape(@", '(J\\/.*$^(B~[]')<CR><CR>
set laststatus=2
set tags+=~/tags
set nocst
set csto=1
set ruler

nnoremap <C-j> b
nnoremap <C-l> w
nnoremap <C-i> 5<Up>
nnoremap <C-k> 5<Down>
set mouse=a

map <C-]> :sp<CR>:exec("tag ".expand("<cword>"))<CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

let g:syntastic_mode_map = { 'mode': 'passive',
             \ 'passive_filetypes': ['perl'] }
let g:syntastic_check_on_wq = 0
 let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

let g:solarized_termcolors=256
let g:solarized_termtrans=1

let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }

command Check %s/\([^ ]\)=>/\1 =>/ge|%s/=>\([^ ]\)/=> \1/ge|%s/}\nsub/}\r\rsub/ge|%s/,\([^ ]\)/, \1/ge
command S SyntasticCheck
command E Errors
set sh=zsh


set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/neoterm'

filetype plugin on

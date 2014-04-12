set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Plugins
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle "https://github.com/kien/ctrlp.vim"
Bundle "tacahiroy/ctrlp-funky"
Bundle 'git://github.com/terryma/vim-multiple-cursors.git'
Bundle 'git://github.com/tomtom/tcomment_vim.git'
Bundle 'ap/vim-css-color'
Bundle 'benmills/vimux'
Bundle 'git://github.com/tpope/vim-surround.git'

" JS
Bundle 'kchmck/vim-coffee-script'
Bundle 'git://github.com/Shutnik/jshint2.vim.git'
Bundle 'git://github.com/tpope/vim-jdaddy.git'

" Colors
Bundle 'flazz/vim-colorschemes'

" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'git://github.com/mattn/emmet-vim.git'

" Rails
Bundle 'git://github.com/tpope/vim-rails.git'
Bundle 'git://github.com/tpope/vim-rake.git'
Bundle 'git://github.com/tpope/vim-bundler.git'

" Clojure
Bundle 'git://github.com/guns/vim-clojure-static.git'
Bundle 'git://github.com/tpope/vim-fireplace.git'
Bundle 'git://github.com/tpope/vim-classpath.git'

" Dash
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" Airline
Bundle 'bling/vim-airline'

" Configs
set ts=2 sts=2 sw=2 expandtab
filetype plugin indent on
set mouse=a
set number
set t_Co=256
color twilight256
set smartindent
set autoindent
set laststatus=2

if has("gui_running")
  set guifont=Monaco:h12
  set guioptions-=r
  set guioptions-=l
endif


if has("autocmd")
  syntax on
  autocmd BufNewFile,BufRead *.coffee setfiletype coffeescript
  autocmd BufWrite * :call Trim()
  autocmd FileType snippets,css,js,html,python,markdown setlocal ts=4 sts=4 sw=4
  autocmd BufNewFile,BufRead *.less set filetype=sass
  autocmd BufRead,BufNewFile *.rabl set filetype=ruby
  autocmd BufRead,BufNewFile *.json set filetype=javascript
  " autocmd BufWritePost .vimrc source $MYVIMRC
  filetype plugin indent on
endif

" Maps
let mapleader = ","
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-P> :CtrlP<CR>
nmap <F3> :NERDTreeToggle<CR>
imap hh <C-y>,

" Menu
set completeopt=longest,menuone
" Using Enter to select any option on autocomplete menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Vimux
let g:VimuxUseNearestPane = 1
map tl :call VimuxRunLastCommand()<CR>
map tx :call VimuxCloseRunner()<CR>
map tr :call VimuxPromptCommand()<CR>

" Leader maps
nmap <leader>v :tabedit $MYVIMRC
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>a :Gwrite<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>s :Gstatus<CR>
nmap <leader>fu :CtrlPFunky<CR>
nmap <leader>p :copen<CR>

" Maps
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" CtrlP
let g:ctrlp_extensions = ['funky']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '>'

set wildignore +=*/node_modules/*,*/vendor/ruby/*,*/vendor/jruby/**,*/tmp/*,*.swp

" Functions
function! MoveTo(newname)
  let a:oldname = expand("%:p")
  exec "saveas " . a:newname
  call delete(a:oldname)
  exec "bdelete " . a:oldname
endfunction


" Git helper functions
function! GetBranch()
  return system("git branch 2> /dev/null | grep '*' | sed -e 's/* //'")
endfunction

function! Push(...)
  if a:0 > 0
    let branch = a:1
  else
    let branch = GetBranch()
  end
  call GitExec(branch, "push")
endfunction

function! GitExec(branch, act)
  let branch = a:branch
  let act = a:act
  call VimuxRunCommand("git " . act . " origin " . branch)
endfunction

function! Pull(...)
  if a:0 > 0
    let branch = a:1
  else
    let branch = GetBranch()
  end
  call GitExec(branch, "pull --rebase")
endfunction

function! Trim()
  %s/\s\+$//e
endfunction

" Maps for Functions
nmap <leader>gp :call Push()
nmap <leader>gf :call Pull()

let coffee_linter = '/usr/local/bin/coffeelint'

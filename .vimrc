set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'git://github.com/terryma/vim-multiple-cursors.git'
Plugin 'git://github.com/tomtom/tcomment_vim.git'
Plugin 'scrooloose/syntastic'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'Valloric/YouCompleteMe'

" OpenProject
Plugin 'https://github.com/rscarvalho/OpenProject.vim.git'

" Indent Line
Plugin 'Yggdroot/indentLine'

" CTRL P
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" Git
Plugin 'tpope/vim-fugitive'

" Tmux tools
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

" Scala
Plugin 'derekwyatt/vim-scala'

" Tabular
Plugin 'godlygeek/tabular'

" Neat
Plugin 'sareyko/neat.vim'

" JS
Plugin 'kchmck/vim-coffee-script'
Plugin 'Shutnik/jshint2.vim'
Plugin 'tpope/vim-jdaddy'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Colors
Plugin 'flazz/vim-colorschemes'

" Ruby Shit
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'git://github.com/mattn/emmet-vim.git'

" Ruby
Plugin 'tpope/vim-rails'

" Clojure
Plugin 'git://github.com/guns/vim-clojure-static.git'
Plugin 'git://github.com/tpope/vim-fireplace.git'
Plugin 'git://github.com/tpope/vim-classpath.git'

" Dash
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'

" Airline
Plugin 'bling/vim-airline'

call vundle#end()

" Configs
set ts=2 sts=2 sw=2 expandtab
set backspace=indent,eol,start
filetype plugin indent on
set mouse=a
set number
set t_Co=256
color twilight256
set clipboard=unnamed
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
  autocmd FileType markdown let b:noTrim='true'
  autocmd FileType snippets,css,html,python,markdown setlocal ts=4 sts=4 sw=4
  autocmd BufNewFile,BufRead *.less setfiletype sass
  autocmd BufRead,BufNewFile *.rabl setfiletype ruby
  autocmd BufRead,BufNewFile Gemfile setfiletype ruby
  autocmd BufRead,BufNewFile *.ejs setfiletype html
  autocmd BufRead,BufNewFile *.json setfiletype javascript
  " autocmd BufWritePost .vimrc source $MYVIMRC
  filetype plugin indent on
endif

" Maps
let mapleader = ","
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-P> :CtrlP<CR>
imap hh <C-y>,
imap <C-tab> <Plug>snipMateTrigger
nmap <F3> :Vex<CR>

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
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>a :Gwrite<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>s :Gstatus<CR>
nmap <leader>fu :CtrlPFunky<CR>
nmap <leader>p :copen<CR>
nmap <leader>j :JSHint<CR>

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
vmap <F1> :w !pbcopy<CR><CR>
imap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" CtrlP
let g:ctrlp_extensions = ['funky']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '>'

" IndentLine
let g:indentLine_char = '_'

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
  if exists('b:noTrim')
   return
  endif
  %s/\s\+$//e
endfunction

" Maps for Functions
nmap <leader>gp :call Push()
nmap <leader>gf :call Pull()
let g:syntastic_javascript_checkers = ['jshint']


let g:OpenProject#folder_prefix = $HOME . "/workspace/"

let g:OpenProject#projects = {
  \"prost": "prost",
  \"prost_view": "prost_view",
  \"prost_videos": "prost_videos"
\}
let coffee_linter = '/usr/local/bin/coffeelint'

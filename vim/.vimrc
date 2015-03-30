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


" CTRL P
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ivalkeen/vim-ctrlp-tjump'

" Markdown
Plugin 'suan/vim-instant-markdown'

" Git
Plugin 'tpope/vim-fugitive'

" Tmux tools
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

" Tabular
Plugin 'godlygeek/tabular'

" Neat
Plugin 'sareyko/neat.vim'

" JS
Plugin 'kchmck/vim-coffee-script'
Plugin 'Shutnik/jshint2.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'dpsxp/vim-backbone'

" Colors
Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'git://github.com/mattn/emmet-vim.git'

" Ruby
Plugin 'tpope/vim-rails'

" Dash
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'

" Editor
Plugin 'editorconfig/editorconfig-vim'

" Airline
Plugin 'bling/vim-airline'

" Tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

call vundle#end()

" Configs
set ts=2 sts=2 sw=2 expandtab
set backspace=indent,eol,start
filetype plugin indent on
set mouse=a
set number
set t_Co=256
set clipboard=unnamed
set smartindent
set autoindent

if has("gui_running")
  set guioptions-=r
  set guioptions-=l
else
  set laststatus=2
endif


if has("autocmd")
  syntax on
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufWrite * :call Trim()
  autocmd FileType markdown let b:noTrim='true'
  autocmd FileType snippets,css,html,python,markdown setlocal ts=4 sts=4 sw=4
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *_spec.js UltiSnipsAddFiletypes javascript_jasmine
  autocmd BufNewFile,BufRead *_spec.coffee UltiSnipsAddFiletypes coffee_jasmine
  autocmd BufNewFile,BufRead *.less set filetype=sass
  autocmd BufRead,BufNewFile *.rabl set filetype=ruby
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby
  autocmd BufRead,BufNewFile *.ejs set filetype=html
  autocmd BufRead,BufNewFile *.json set filetype=javascript
  color codeschool
endif

" Maps
let mapleader = ","
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-P> :CtrlP<CR>
imap hh <C-y>,
imap kk <Plug>snipMateNextOrTrigger
nmap <F3> :Vex<CR>

" Copy and paste (god bless stackoverflow)
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

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
nmap <leader>b  :CtrlPBuffer<CR>
nmap <leader>a  :Gwrite<CR>
nmap <leader>c  :Gcommit<CR>
nmap <leader>s  :Gstatus<CR>
nmap <leader>t  :CtrlPtjump<CR>
nmap <leader>fu :CtrlPFunky<CR>
nmap <leader>p  :copen<CR>
nmap <leader>j  :JsDoc<CR>

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
let g:ctrlp_extensions = ['funky', 'tjump']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '>'

" Utilsnips
let g:UltiSnipsExpandTrigger="aa"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Javascript
let g:jsdoc_default_mapping = 0
let g:jsdoc_underscore_private = 1
let g:jsdoc_allow_shorthand = 1

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

set wildignore +=*/node_modules/*,*/vendor/ruby/*,*/vendor/jruby/**,*/tmp/*,*.swp,*/scripts/vendor/*

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
nmap <leader>gp :call Push()<CR>
nmap <leader>gf :call Pull()<CR>

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_aggregate_errors = 1

let coffee_linter = '/usr/local/bin/coffeelint'

" 24 bits
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set guicolors

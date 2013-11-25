set ts=2 sts=2 sw=2 expandtab
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

if has("gui_running")
  set guifont=Monaco:h12
  set guioptions-=r
  set guioptions-=l
  set number
  color github
endif

" Plugins
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle "https://github.com/kien/ctrlp.vim"
Bundle "tacahiroy/ctrlp-funky"
Bundle 'kchmck/vim-coffee-script'
Bundle 'git://github.com/terryma/vim-multiple-cursors.git'
Bundle 'git://github.com/tomtom/tcomment_vim.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'

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

" Dash
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

if has("autocmd")
  syntax on
  autocmd BufNewFile,BufRead *.js.coffee setfiletype coffeescript
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd FileType snippets setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufNewFile,BufRead *.less set filetype=sass
  " autocmd BufWritePost .vimrc source $MYVIMRC
  filetype plugin indent on
endif

" Maps
let mapleader = ","
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-P> :CtrlP<CR>
nmap <F3> :NERDTreeToggle<CR>
imap hh <C-y>,

" Leader maps
nmap <leader>v :tabedit $MYVIMRC
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>a :Gwrite<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>s :Gstatus<CR>
nmap <leader>fu :CtrlPFunky<CR>

" CtrlP
let g:ctrlp_extensions = ['funky']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set wildignore +=*/vendor/ruby/*,*/vendor/jruby/**,*/tmp/*,*.swp

set ts=2 sts=2 sw=2 expandtab
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
set guifont=Monaco:h13

" Plugins
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'kchmck/vim-coffee-script'
Bundle 'git://github.com/terryma/vim-multiple-cursors.git'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"


if has("autocmd")
  syntax on
  autocmd BufNewFile,BufRead *.js.coffee setfiletype coffeescript
  autocmd BufWritePre * :%s/\s\+$//e
  filetype plugin indent on
endif

" Maps
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-P> :CommandT<CR>
